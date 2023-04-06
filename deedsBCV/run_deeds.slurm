#!/bin/bash

#SBATCH -J 06
#SBATCH -p gpu1
#SBATCH -N 1
#SBATCH -n 1

#SBATCH -o examples/results/logs/out06.txt
#SBATCH -e examples/results/logs/err06.txt

SLURM_SUBMIT_DIR=/public/home/jd_shb/fromgithub/multimodal/deedsBCV
cd $SLURM_SUBMIT_DIR

fix_img="examples/datasets/img00${SLURM_JOB_NAME}_tcia_MR.nii.gz"
mov_img="examples/datasets/img00${SLURM_JOB_NAME}_tcia_CT.nii.gz"
mov_seg="examples/datasets/seg00${SLURM_JOB_NAME}_tcia_CT.nii.gz"

./linearBCV \
    -F $fix_img \
    -M $mov_img \
    -O "examples/results/linear_${SLURM_JOB_NAME}_${SLURM_JOB_NAME}"

./deedsBCV \
    -F $fix_img \
    -M $mov_img \
    -O "examples/results/nonlinear_${SLURM_JOB_NAME}_${SLURM_JOB_NAME}" \
    -A "examples/results/linear_${SLURM_JOB_NAME}_${SLURM_JOB_NAME}_matrix.txt" \
    -S $mov_seg
