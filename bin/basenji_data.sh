#!/bin/bash
#SBATCH -n 2
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH --gres=gpu:2
#SBATCH --mem=30Gs
#SBATCH -t 12:00:00
# Specify a job name:
#SBATCH -J basenji_train
# Specify an output file
#SBATCH -o slurm-%j.out
#SBATCH -e slurm-%j.err
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,BEGIN
#SBATCH --mail-user=yusuke_suita@brown.edu

module load cudnn/8.2.0 
module load cuda/11.1.1 
module load gcc/10.2

output="/gpfs/data/ntapinos/ysuita/basenji_mod/data/GSC_ATAC"
hg38="/gpfs/data/shared/databases/refchef_refs/grch38_release98/primary/Homo_sapiens.GRCh38.dna.primary_assembly.fa"
bigwig="/gpfs/data/ntapinos/ysuita/basenji_mod/data/GSC_ATAC/GSC_ATAC_wigs.txt"
/gpfs/data/ntapinos/ysuita/basenji_mod/bin/basenji_data.py -d .1 -g /users/ysuita/data/ysuita/basenji/tutorials/data/unmap_macro.bed -l 131072 -o $output -p 8 -t .1 -v .1 -w 128 $hg38 $bigwig
