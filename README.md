# T1DGC: A multi-ancestry GWAS of type 1 diabetes
Genome-wide association study of type 1 diabetes in AFR, AMR, EUR ancestry individuals. </br>
For questions, please contact Dominika Michalek (dam8mt@virginia.edu).

## Genotyped data
All samples were genotyped using the Illumina Infinium CoreExome BeadChip in the Genome Sciences Laboratory at the University of Virginia. </br>

Genotyped data underwent following steps:
1. SNP- and sample-level QC
```bash
bash qc.bsh
```

2. Population structure and ancestry inference (+QC)
```bash
bash dst.bsh
```

3. Generation of pseudo-case pseudo-control individuals from family dataset
```bash
bash pseudo_cc.bsh
```

4. Principal Component Analysis (PCA)
```bash
bash pca.bsh
```

## Imputation to TOPMed Reference panel and HLA-TAPAS
1. Prepare data for imputation
```bash
# uses Rayner perl script (HRC-1000G-check-bim-NoReadKey.pl)
bash pre_imputation.bsh
```

2. Impute data to [TOPMed reference panel](https://imputation.biodatacatalyst.nhlbi.nih.gov/#!) (1.5.7 and 1.6.6) and [HLA-TAPAS](https://imputationserver.sph.umich.edu/index.html#!) (1.5.8)

3. Download, unzip and filter imputation results (TOPMed)
```bash
bash imp_filter.bsh

# filter imputed plink files with MI < 0.1
bash imp_mi.bsh

# filter imputed VCF files with MI < 0.1
bash imp_vcf.bsh
```

4. Download, unzip and filter imputation results (HLA-TAPAS)
```bash
bash HLA/imp_hla.bsh
```

## Association analyses
1. Logistic mixed model regression in SAIGE for each ancestry group (AFR, AMR, EUR)
```bash
# prepare SAIGE input files
bash SAIGE/input_saige.bsh

# run SAIGE
# step 1
sbatch SAIGE/saige_HCE_AFR_step1.slurm
sbatch SAIGE/saige_HCE_AMR_step1.slurm
sbatch SAIGE/saige_HCE_pcc_step1.slurm

# step2
bash SAIGE/saige_slurm_AFR_imp_dosage.bsh
bash SAIGE/saige_slurm_AMR_imp_dosage.bsh
bash SAIGE/saige_slurm_pcc_imp_dosage.bsh
```

2. Frailty mixed model regression in GATE for each ancestry group (AFR, AMR, EUR)
```bash
# prepare GATE input files
bash GATE/input_gate.bsh

# run GATE
# step 1
sbatch GATE/gate_HCE_AFR_step1.slurm
sbatch GATE/gate_HCE_AMR_step1.slurm
sbatch GATE/gate_HCE_pcc_step1.slurm

# step 2
bash GATE/gate_slurm_AFR_imp_dosage.bsh
bash GATE/gate_slurm_AMR_imp_dosage.bsh
bash GATE/gate_slurm_pcc_imp_dosage.bsh
```

3. Meta-analysis in METAL for both T1D risk (SAIGE) and age at onset (GATE)
```bash
# uses metal scripts
bash SAIGE/saige_fullGRM.bsh
bash GATE/gate_fullGRM.bsh
```

4. HLA association analysis in SAIGE
```bash
# prepare SAIGE input files
bash HLA/SAIGE/input_saige_hla.bsh

# run SAIGE
# step 1
sbatch HLA/SAIGE/saige_HCE_AFR_step1.slurm
sbatch HLA/SAIGE/saige_HCE_AMR_step1.slurm
sbatch HLA/SAIGE/saige_HCE_pcc_EUR_step1.slurm

# step2
sbatch HLA/SAIGE/saige_HCE_AFR_chr6_step2.slurm
sbatch HLA/SAIGE/saige_HCE_AMR_chr6_step2.slurm
sbatch HLA/SAIGE/saige_HCE_pcc_EUR_chr6_step2.slurm
```

5. HLA association analysis in GATE
```bash
# prepare GATE input files
bash HLA/GATE/input_gate_hla.bsh

# run GATE
# step 1
sbatch HLA/GATE/gate_HCE_AFR_step1.slurm
sbatch HLA/GATE/gate_HCE_AMR_step1.slurm
sbatch HLA/GATE/gate_HCE_pcc_EUR_step1.slurm

# step2
sbatch HLA/GATE/gate_HCE_AFR_chr6_step2.slurm
sbatch HLA/GATE/gate_HCE_AMR_chr6_step2.slurm
sbatch HLA/GATE/gate_HCE_pcc_EUR_chr6_step2.slurm
```

6. HLA meta-analysis in METAL for both T1D risk (SAIGE) and age at onset (GATE)
```bash
# uses metal scripts
bash HLA/SAIGE/hla_saige_fullGRM.bsh
bash HLA/GATE/hla_gate_fullGRM.bsh
```

7. HLA class II haplotype (_DRB1_-_DQA1_-_DQB1_) analysis
```bash
```

## FUMA
1. Run SNP2GENE module
2. Run GENE2FUNCTION module
