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

Use these modules if you use GPU in Oscar
module load cuda/11.3.1
module load gcc/10.2

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

Trained with GSC1 ATAC merged bigwig file 

[NEXT STEP]: Processing bigwig of GSC1 ATAC dup1 and dup2. Alingment on GSC2 ATAC. 

Training/Learn

```
basenji_train.py
```

The model got trained by using HDF5 (you can use basenji_training.sh). 

Accuracy (Test gene expression predictions)
```
basenji_test.py
```
Build model by using basenji_test.py 

[Next Step]: Run basenji_GSC1_ATAC_test.sh on GSC1 ATAC merged bigwig-trained model (0.h5?)
Visualize 0.h5 file 

[Next Step]: Hypo-parameter tuning (take a look at JSON file)

Analysis 
- Analysis 1: In-silico mutagenesis
  - Compute scores by applying basenji_sat_bed.py: basenji_sat_bed.py (check basenji_sat_bed.sh)
  - Visualization: basenji_sat_plot.py (check basenji_sat_plot.sh)

(- Analysis 1: basenji_sat_vcf.py: VCF file for varient-centered mutagenesis)
- Analysis 2: SNP activity difference
  - basenji_sad.py: SNP actviity difference score
  -[NEXT STEP]: Run basenji_sad.sh to get outcome
  Visualize /gpfs/data/ntapinos/ysuita/basenji_mod/tutorials/output/rfx6_bed/sad.h5
  - basenji_sed.py: SNP expression difference score
