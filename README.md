# T1DGC: A multi-ancestry GWAS of type 1 diabetes
Genome-wide association study of type 1 diabetes in AFR, AMR, EUR ancestry individuals. </br>
For questions, please contact Dominika Michalek (dam8mt@virginia.edu).

## Genotyped data
All samples were genotyped using the Illumina Infinium CoreExome BeadChip in the Genome Sciences Laboratory at the University of Virginia. </br>

Genotyped data underwent following steps:
1. QC
```bash
bash qc.bsh
```
3. Population structure and ancestry inference
```bash
bash dst.bsh
```
5. Generation of pseudo-case pseudo-control individuals from family dataset
6. PCA

## Imputation
1. Prepare data for imputation
```bash
bash pre-imputation.bsh
```
3. Impute data to TOPMed reference panel and HLA-TAPAS (chr6)
4. Download, unzip and filter imputation results

## Association analyses
1. Logistic mixed model regression in SAIGE for each ancestry group (AFR, AMR, EUR)
2. Frailty mixed model regression in GATE for each ancestry group (AFR, AMR, EUR)
3. Meta-analysis in METAL for both T1D risk and age at onset
4. HLA association analyses in SAIGE and GATE
5. HLA class II haplotypes (_DRB1_-_DQA1_-_DQB1_) analysis

## FUMA
1. SNP2GENE module
2. GENE2FUNCTION module
