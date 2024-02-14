#!/bin/bash 

#SBATCH --job-name='gate_HCE_pcc_EUR_age_chr6_step2_dosage_survival'
#SBATCH --output='/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/GATE/fullGRM_repeated/output/submission/gate_HCE_pcc_EUR_age_chr6_step2_dosage_survival.log'
#SBATCH --mem='30000'
#SBATCH --cpus-per-task='8'
#SBATCH --time='01-24:00:00'
#SBATCH --partition='standard'
#SBATCH -m block
#SBATCH --ntasks=1
#SBATCH --account rich_immunochip_paid 

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

module load singularity 

vcf=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/four_digit_v2/VCF/Pseudo_cc/EUR
input=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/GATE/fullGRM_repeated/input/EUR
output=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/GATE/fullGRM_repeated/output/EUR

### Single variant association tests
## Step 2: performing single-variant association tests
# VCF containing dosages (--vcfField=DS) 

# CHR 6 

singularity exec gate3.sif step2_SPAtests.R \
--vcfFile=$vcf/T1DGC_HCE_imp_pseudo_cc_EUR_chr6.vcf.gz \
--vcfFileIndex=$vcf/T1DGC_HCE_imp_pseudo_cc_EUR_chr6.vcf.gz.csi \
--vcfField=DS \
--chrom=6 \
--minMAF=0.005 \
--minMAC=10 \
--sampleFile=$input/sampleID_pcc_EUR.txt \
--GMMATmodelFile=$output/HCE_pcc_EUR_survival.rda \
--varianceRatioFile=$output/HCE_pcc_EUR_survival.varianceRatio.txt \
--SAIGEOutputFile=$output/HCE_pcc_EUR_age_chr6.GATE.vcf.dosage.txt \
--numLinesOutput=2 \
--IsOutputAFinCaseCtrl=TRUE 

exit
