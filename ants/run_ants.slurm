#!/bin/bash
#SBATCH -J ctmr10
#SBATCH -p gpu1
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o logs/out.txt
#SBATCH -e logs/err.txt

cd $SLURM_SUBMIT_DIR

python ants_baseline.py \
    -dataset ct-mr \
    -img_folder /public/home/jd_shb/fromgithub/multimodal/OBELISK_V02/preprocess/datasets/MICCAI2021/L2R_Task1_CT2MR \
    -label_folder /public/home/jd_shb/fromgithub/multimodal/OBELISK_V02/preprocess/datasets/MICCAI2021/L2R_Task1_CT2MR \
    -mov_numbers "10" \
    -mov_name img00?_tcia_CT.nii.gz \
    -mov_label seg00?_tcia_CT.nii.gz \
    -fix_numbers "10" \
    -fix_name img00?_tcia_MR.nii.gz \
    -fix_label seg00?_tcia_MR.nii.gz \
    -trans_typ SyN \
    -output ./Result/ANTs_SyN/ct-mr
