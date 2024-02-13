#!/bin/bash

#SBATCH --job-name='gate_HCE_pcc_age_step1_survival'
#SBATCH --output='/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/GATE_imputed_data-2022-07-21/fullGRM_repeated/output/submission/gate_HCE_pcc_age_step1_survival.log'
#SBATCH --mem='16000'
#SBATCH --cpus-per-task='8'
#SBATCH --time='00-24:00:00'
#SBATCH --partition='standard'
#SBATCH -m block
#SBATCH --ntasks=1
#SBATCH --account rich_immunochip_paid

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

module load singularity

input=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/GATE_imputed_data-2022-07-21/fullGRM_repeated/input/Pseudo_cc
output=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/GATE_imputed_data-2022-07-21/fullGRM_repeated/output/Pseudo_cc

## Step 1: fitting the null logistic/linear mixed model

# For Binary traits:

singularity exec gate3.sif step1_fitNULLGLMM.R     \
--plinkFile=$input/T1DGC_HCE_pcc-2021-01-20_no_MZ_pruned \
--phenoFile=$input/T1DGC_HCE_pc_pcc_pheno_survival_age.txt \
--phenoCol=AFF \
--covarColList=PC1,PC2,PC3,PC4,PC5,PC6,PC7 \
--sampleIDColinphenoFile=IID \
--traitType=survival        \
--eventTimeCol=AGE \
--eventTimeBinSize=1 \
--outputPrefix=$output/HCE_pcc_survival \
--nThreads=4 \
--LOCO=FALSE \
--pcgforUhatforSurvAnalysis=TRUE \

exit
