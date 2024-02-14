#!/bin/bash

#SBATCH --job-name='gate_HCE_AFR_age_step1_survival'
#SBATCH --output='/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/GATE/fullGRM/output/submission/gate_HCE_AFR_age_step1_survival.log'
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

input=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/GATE/fullGRM/input/AFR
output=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/GATE/fullGRM/output/AFR

## Step 1: fitting the null logistic/linear mixed model

# For Binary traits:

singularity exec gate3.sif step1_fitNULLGLMM.R     \
--plinkFile=$input/T1DGC_HCE_AFR-2021-01-20_pruned \
--phenoFile=$input/T1DGC_HCE_pc_AFR_pheno_survival_age.txt \
--phenoCol=AFF \
--covarColList=PC1,PC2,PC3,PC4 \
--sampleIDColinphenoFile=IID \
--traitType=survival        \
--eventTimeCol=AGE \
--eventTimeBinSize=1 \
--outputPrefix=$output/HCE_AFR_survival \
--nThreads=4 \
--LOCO=FALSE \
--pcgforUhatforSurvAnalysis=TRUE \

exit
