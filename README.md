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
3. Population structure and ancestry inference (+QC)
```bash
bash dst.bsh
```
5. Generation of pseudo-case pseudo-control individuals from family dataset
```bash
bash pseudo_cc.bsh
```
7. Principal Component Analysis (PCA)
```bash
bash pca.bsh
```

## Imputation
1. Prepare data for imputation
```bash
# uses Rayner perl script (HRC-1000G-check-bim-NoReadKey.pl)
bash pre_imputation.bsh
```
3. Impute data to [TOPMed reference panel](https://imputation.biodatacatalyst.nhlbi.nih.gov/#!) (1.5.7 and 1.6.6)and [HLA-TAPAS](https://imputationserver.sph.umich.edu/index.html#!) (1.5.8)
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
