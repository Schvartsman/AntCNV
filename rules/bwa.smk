SAMPLES = config["samples"]
FASTQ_DIR = config["fastq_dir"]
REF = config["reference"]
OUT_DIR = config["output_dir"]
THREADS = config["threads"]

rule bwa_index:
	input:
		REF
	output:
		REF + ".bwt"
	conda:
		"envs/bwa.yaml"
	shell:
		"""
		bwa index {input}
		"""

rule bwa_mem:
	input:
		ref=REF
		fastq=lambda wc: f"{FASTQ_DIR}/{wc.sample}.fastq.gz"
	output:
		sam=f"{OUT_DIR}/{{sample}}.sam"
	threads:
		THREADS
	conda:
		"env/bwa.yaml"
	shell:
		"""
		mkdir -p {OUT_DIR}
		bwa mem -t {threads] [input.ref} {input.fastq} > {output.sam}
		"""

rule sam_to_bam:
	input:
		sam=f"{OUT_DIR}/{sample}}.sam"
	output:
		bam=f"{OUT_DIR}/{sample}}.bam"
	conda:
		"env/bwa.yaml"
	shell:
		"""
		samtools view -b {input.sam} > {output.bam}
		"""
