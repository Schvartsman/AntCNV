FROM mambaorg/micromamba:1.5.10

USER root
WORKDIR /workspace

RUN micromamba install -y -n base -c conda-forge -c bioconda samtools=1.20 && micromamba clean --all --yes

CMD ["samtools", "--version"]
