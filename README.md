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
bam_cov.py
```
```
basenji_data.py
```
**
[Next step 2]: Getting GSC1 (GB2) ATAC BigWig files and also getting hg38 Ensemble fasta files** (by Deniz)

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

(try basenji_test_genes.py by taking TensorFlow Saver file, Trained Basenji model and parameters file).

**[Next Step]: Change basenji_test.py's parameters in a way that you would be able to retrive the result

**[Nest Step]: Visualize the result of basenji_test.py**** (by Yusuke)

[Next Step]: Idnetify input data for basenji_sat_bed.py (By Yusuke)

Analysis 
- Analysis 1: In-silico mutagenesis
  - Compute scores
    -  basenji_sat_bed.py: basenji_sat_bed.py
    -  basenji_sat_vcf.py: VCF file for varient-centered mutagenesis 
  - Visualization: basenji_sat_plot.py 

- Analysis 2: SNP activity difference
  - basenji_sad.py: SNP actviity difference score
  - basenji_sed.py: SNP expression difference score




