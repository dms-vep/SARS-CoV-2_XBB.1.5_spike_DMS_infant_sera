#!/bin/bash
#
#SBATCH -c 16

snakemake -j 16 --rerun-incomplete --software-deployment-method conda -s dms-vep-pipeline-3/Snakefile
