#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --time=24:00:00
#SBATCH --array=0-0
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --mail-user=christian.poitras@ircm.qc.ca
#SBATCH --mail-type=ALL

if [ -z "$SLURM_ARRAY_TASK_ID" ]
then
  SLURM_ARRAY_TASK_ID=0
fi

# Index FASTA file first
# bowtie2-build sacCer3.fa sacCer3.fa.index
#
# Recommended parameters for bowtie2
# -x sacCer3.fa.index -X 1000
runbowtie2 --threads 4 --index $SLURM_ARRAY_TASK_ID $@