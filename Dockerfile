FROM ubuntu:22.04

RUN apt-get update && apt-get install -y samtools && apt-get install -y bwa

CMD ["samtools", "--version"]
