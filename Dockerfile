FROM mambaorg/micromamba:1.5.10

USER root
WORKDIR /workspace

RUN micromamba install -y -n base -c conda-forge -c bioconda bwa && micromamba clean --all --yes

CMD ["samtools", "--version"]
