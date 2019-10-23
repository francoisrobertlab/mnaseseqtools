#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --time=24:00:00
#SBATCH --array=0-0
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=20G
#SBATCH --mail-user=christian.poitras@ircm.qc.ca
#SBATCH --mail-type=ALL

if [ -z "$SLURM_ARRAY_TASK_ID" ]
then
  SLURM_ARRAY_TASK_ID=0
fi

intersectbed -s sample-filter.txt -a top10.txt $SLURM_ARRAY_TASK_ID
split -s sample-filter.txt -i $SLURM_ARRAY_TASK_ID
prepgenecov -s sample-filter.txt -i $SLURM_ARRAY_TASK_ID
genecov -s sample-filter.txt -i $SLURM_ARRAY_TASK_ID