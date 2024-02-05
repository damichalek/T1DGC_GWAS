# T1DGC: A multi-ancestry GWAS of type 1 diabetes
Genome-wide association study of type 1 diabetes in AFR, AMR, EUR ancestry individuals. 

## Data
All samples were genotyped using the Illumina Infinium CoreExome BeadChip in the Genome Sciences Laboratory at the University of Virginia.

### QC
Raw genotyped data were subjected to SNP-level and sample-level quality control using KING software (version 2.2.8). </br>

```bash
bash qc.bsh
```

### Population structure and ancestry inference

```bash
bash dst.bsh
```

## Imputation
