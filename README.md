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

BEFORE running a script below, run these commands to activate basenji
  export BASENJIDIR=/gpfs/data/ntapinos/ysuita/basenji_mod
  export PATH=$BASENJIDIR/bin:$PATH
  export PYTHONPATH=$BASENJIDIR/bin:$PYTHONPATH

Proprocess (convert Bigwig file to TF files/bed files by using FASTA file)
```
basenji_data.py
```
Trained with GSC1 ATAC merged bigwig file 

[NEXT STEP]: Processing bigwig of GSC1 ATAC dup1 and dup2. Alingment on GSC2 ATAC. 

Training/Learn
```
basenji_train.py (or basenji_train_GSC1_ATAC.sh)
```
The model got trained by using tfr files (you can use basenji_training.sh). 
[NEXT STEP] Visualize loss/epoch (check trainer.py "VISUALIZATION"))


Accuracy (Test gene expression predictions)
```
basenji_test.py
```
Build model by using basenji_test.py [Note: Make sure to match # of input bigwigs and # of units in "head" in params_small_ATAC.json file


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
