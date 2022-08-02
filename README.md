# basenji_modified

Objectives:
1. Train deep convolutional neural networks to predict regulatory activity along very long chromosome-scale DNA sequences
2. Score variants according to their predicted influence on regulatory activity across the sequence and/or for specific genes.
3. Annotate the distal regulatory elements that influence gene activity.
4. Annotate the specific nucleotides that drive regulatory element function.

Input sequencing data for the model:
ATAC-seq BAM files

Input file format for bansenji model: 
BigWig coverage tracks
Genome FASTA file (hg38 ensemble)

Workflow:
- Preprocess
- Learn
- Accuracy
- Regulatory Element Analysis
- Variaent Analysis

Proprocess (convert BAM file to ED5 (or BigWig file) by using FASTA file)

```
basenji_data.py
```

Training/Learn

```
basenji_train.py
```
module load cuda/11.3.1
module load gcc/10.2

The model got trained by using HDF5 (you can use basenji_training.sh). 

Accuracy (Test gene expression predictions)
```
basenji_test.py
```
Build model by using basenji_test.py 


[Next Step]: Check input file for GSC and then apply it to basenji_test.py

[Next Step]: Hypo-parameter tuning (take a look at JSON file)

Analysis 
- Analysis 1: In-silico mutagenesis
  - Compute scores by applying basenji_sat_bed.py: basenji_sat_bed.py (check basenji_sat_bed.sh)
  - Visualization: basenji_sat_plot.py (check basenji_sat_plot.sh)

(- Analysis 1: basenji_sat_vcf.py: VCF file for varient-centered mutagenesis)
- Analysis 2: SNP activity difference
  - basenji_sad.py: SNP actviity difference score
  - basenji_sed.py: SNP expression difference score
