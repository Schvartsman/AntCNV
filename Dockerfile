FROM mambaorg/micromamba:1.5.10

RUN micromamba install -y -n base -c conda-forge -c bioconda samtools=1.21 && micromamba clean --all --yes

CMD ["samtools", "--version"]
