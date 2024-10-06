import sys
import urllib.request


sys.stderr = sys.stdout = open(snakemake.log[0], "w")

assert len(snakemake.params.urls) == len(snakemake.output.csvs)

for url, csv in zip(snakemake.params.urls, snakemake.output.csvs):
    print(f"Getting {url} to {csv}")
    urllib.request.urlretrieve(url, csv)
