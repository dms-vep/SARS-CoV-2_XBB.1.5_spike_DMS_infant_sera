# Analysis of natural spike diversity performed outside the main pipeline
This subdirectory contains analysis of the natural diversity of spike at different sites, and is run manually by the Jupyter notebook in this subdirectory (so outside the main pipeline).
It plots natural sequence diversity versus DMS.

The file [data/NC_045512.2.gp](data/NC_045512.2.gp) defines the domain structure of spike.

The file [data/ncov_open_global_all-time.json](data/ncov_open_global_all-time.json) is the Nextstrain JSON downloaded from [https://nextstrain.org/ncov/open/global/all-time](https://nextstrain.org/ncov/open/global/all-time) on Dec-28-2024 that contains all of the data on the submsampled Nextstrain global SARS-CoV-2 phylogeny using open sequences.

The Jupyter notebook [spike_schematic.ipynb](spike_schematic.ipynb) is run manually to analyze this JSON and other data files to make schematics of the spike with the number of effective amino acids at each site, which are place in `.results/`.
