#!/bin/bash 

#SBATCH --job-name='saige_HCE_AMR_chr6_step2_imp_dosage'
#SBATCH --output='/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/SAIGE/fullGRM_1.1.6.1/EUR/output/submission/saige_HCE_AMR_chr6_step2_imp_dosage.log'
#SBATCH --mem='16000'
#SBATCH --cpus-per-task='8'
#SBATCH --time='02-24:00:00'
#SBATCH --partition='standard'
#SBATCH -m block
#SBATCH --ntasks=1
#SBATCH --account rich_immunochip_paid 

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

module load singularity 

vcf=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/four_digit_v2/VCF/AMR
input=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/SAIGE/fullGRM_1.1.6.1/EUR/input/AMR
output=/nv/vol185/T1DGC/USERS/dam8mt/data/T1DGC_Humancore_Exome/HLA_imputation/SAIGE/fullGRM_1.1.6.1/EUR/output/AMR

### Single variant association tests
## Step 2: performing single-variant association tests
# VCF containing dosages (--vcfField=DS) 

# CHR 6 

singularity exec saige1161.sif step2_SPAtests.R \
--vcfFile=$vcf/T1DGC_HCE_imp_AMR_chr6.vcf.gz \
--vcfFileIndex=$vcf/T1DGC_HCE_imp_AMR_chr6.vcf.gz.csi \
--vcfField=DS \
--chrom=6 \
--minMAF=0.005 \
--minMAC=10 \
--sampleFile=$input/sampleID_AMR.txt \
--GMMATmodelFile=$output/HCE_AMR_binary.rda \
--varianceRatioFile=$output/HCE_AMR_binary.varianceRatio.txt \
--SAIGEOutputFile=$output/HCE_AMR_imp_chr6.SAIGE.vcf.dosage.txt \
--LOCO=FALSE \
--is_output_moreDetails=TRUE 

exit
