#!/bin/bash

#SBATCH --job-name='saige_HCE_pcc_EUR_step1'
#SBATCH --output='/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/SAIGE/fullGRM_1.1.6.1/EUR/output/submission/saige_HCE_pcc_EUR_step1.log'
#SBATCH --mem='30000'
#SBATCH --cpus-per-task='8'
#SBATCH --time='00-12:00:00'
#SBATCH --partition='standard'
#SBATCH -m block
#SBATCH --ntasks=1
#SBATCH --account rich_immunochip_paid

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

module load singularity

input=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/SAIGE/fullGRM_1.1.6.1/EUR/input/EUR
output=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/SAIGE/fullGRM_1.1.6.1/EUR/output/EUR

## Step 1: fitting the null logistic/linear mixed model

# For Binary traits:

singularity exec saige1161.sif step1_fitNULLGLMM.R     \
--plinkFile=$input/T1DGC_HCE_pcc_EUR-2021-01-20_no_MZ_pruned \
--phenoFile=$input/T1DGC_HCE_pc_pcc_EUR_pheno_survival.txt \
--phenoCol=AFF \
--covarColList=PC1,PC2,PC3,PC4 \
--sampleIDColinphenoFile=IID \
--traitType=binary        \
--outputPrefix=$output/HCE_pcc_EUR_binary \
--nThreads=4 \
--LOCO=FALSE \
--IsOverwriteVarianceRatioFile=FALSE

exit
