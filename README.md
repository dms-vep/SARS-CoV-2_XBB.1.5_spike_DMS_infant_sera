# Deep mutational scanning of SARS-CoV-2 XBB.1.5 spike to map escape from primary infection infants
Study by Bernadeta Dadonaite and Jesse Bloom in collaboration with Mary Staat's group.

This repo contains the data and code for pseudovirus deep mutational scanning of XBB.1.5 spike with respect to escape from sera from infants first exposed to XBB variants.
The library used here and some of the comparator adult data are from the previously published study [Dadonaite et al (2024)](https://www.nature.com/articles/s41586-024-07636-1).

For documentation of the analysis, see [https://dms-vep.github.io/SARS-CoV-2_XBB.1.5_spike_DMS_infant_sera/](https://dms-vep.github.io/SARS-CoV-2_XBB.1.5_spike_DMS_infant_sera/)

## Organization of this repo

### `dms-vep-pipeline-3` submodule

Most of the analysis is done by the [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3), which was added as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to this pipeline via:

    git submodule add https://github.com/dms-vep/dms-vep-pipeline-3

This added the file [.gitmodules](.gitmodules) and the submodule [dms-vep-pipeline-3](dms-vep-pipeline-3), which was then committed to the repo.
Note that if you want a specific commit or tag of [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3) or to update to a new commit, follow the [steps here](https://stackoverflow.com/a/10916398), basically:

    cd dms-vep-pipeline-3
    git checkout <commit>

and then `cd ../` back to the top-level directory, and add and commit the updated `dms-vep-pipeline-3` submodule.
You can also make changes to the [dms-vep-pipeline-3](https://github.com/dms-vep/dms-vep-pipeline-3) that you commit back to that repo.

### Configuration and running the pipeline
The configuration for the pipeline is in [config.yaml](config.yaml) and the files in [./data/](data) referenced therein.
To run the pipeline, do:

    snakemake -j 8 --use-conda -s dms-vep-pipeline-3/Snakefile

Note that the pipeline is currently configured to start by processing the FASTQ files from the paths where they are stored on the Hutch server as specified in [data/barcode_runs.csv](data/barcode_runs.csv).
To instead simply run the pipeline from the precomputed barcode counts files stored in this repo, set `use_precomputed_barcode_counts: true` in [config.yaml](config.yaml).

To run on the Hutch cluster via [slurm](https://slurm.schedmd.com/), you can run the file [run_Hutch_cluster.bash](run_Hutch_cluster.bash):

    sbatch -c 8 run_Hutch_cluster.bash

### Results and documentation
The results of running the pipeline are placed in [./results/](results).
Only some of these results are tracked to save space (see [.gitignore](.gitignore)).

The pipeline builds HTML documentation for the pipeline in [./docs/](docs), which is rendered via GitHub Pages at [https://dms-vep.github.io/SARS-CoV-2_XBB.1.5_spike_DMS_infant_sera](https://dms-vep.github.io/SARS-CoV-2_XBB.1.5_spike_DMS_infant_sera).

Analysis of validation experiments for DMS is in [./validation_notebooks/](validation_notebooks) 
