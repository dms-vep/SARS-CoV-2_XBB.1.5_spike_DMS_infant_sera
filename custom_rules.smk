"""Custom rules used in the ``snakemake`` pipeline.

This file is included by the pipeline ``Snakefile``.

"""

# from https://www.nature.com/articles/s41586-024-07636-1
adult_sera = [
    "287C",
    "288C",
    "343C",
    "493C",
    "497C",
    "498C",
    "500C",
    "501C",
    "503C",
    "505C",
]


rule get_adult_escape:
    """Get escape measurements from published adult sera."""
    params:
        urls=[
            os.path.join(
                "https://raw.githubusercontent.com/dms-vep/SARS-CoV-2_XBB.1.5_spike_DMS",
                "refs/heads/main/results/antibody_escape/averages",
                f"sera_{serum}_mediumACE2_mut_effect.csv",
            )
            for serum in adult_sera
        ],
    output:
        csvs=[
            f"results/dadonaite2024nature_files/adult_{serum}_escape.csv"
            for serum in adult_sera
        ],
    log:
        "results/logs/get_adult_escape.txt",
    conda:
        os.path.join(config["pipeline_path"], "environment.yml")
    script:
        "scripts/get_adult_escape.py"


rule configure_dms_viz:
    """Configure a JSON file for `dms-viz`."""
    input:
        phenotypes_csv="results/summaries/infant_vs_adult_sera.csv",
        per_antibody_escape_csv="results/summaries/infant_vs_adult_sera_per_antibody_escape.csv",
        site_numbering_map=config["site_numbering_map"],
        nb="notebooks/configure_dms_viz.ipynb",
    output:
        dms_viz_json="results/dms-viz/dms-viz.json",
        dms_viz_phenotypes="results/dms-viz/phenotypes.csv",
        pdb_file="results/dms-viz/pdb_file.pdb",
        nb="results/notebooks/configure_dms_viz.ipynb",
    params:
        dms_viz_subdir=lambda _, output: os.path.dirname(output.dms_viz_json),
        pdb_id="8iot",  # all-down XBB.1 spike structure
        chains="A,B,C",  # chains in the PDB to color
    log:
        "results/logs/configure_dms_viz.txt",
    conda:
        "envs/dms-viz.yml"
    shell:
        """
        papermill {input.nb} {output.nb} \
            -p phenotypes_csv {input.phenotypes_csv} \
            -p per_antibody_escape_csv {input.per_antibody_escape_csv} \
            -p site_numbering_map {input.site_numbering_map} \
            -p dms_viz_json {output.dms_viz_json} \
            -p dms_viz_phenotypes {output.dms_viz_phenotypes} \
            -p pdb_file {output.pdb_file} \
            -p dms_viz_subdir {params.dms_viz_subdir} \
            -p pdb_id {params.pdb_id} \
            -p chains {params.chains} \
            &> {log}
        """


other_target_files.append(rules.configure_dms_viz.output.dms_viz_json)
