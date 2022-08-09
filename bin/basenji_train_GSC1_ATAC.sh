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
#output="/users/ysuita/data/ysuita/basenji_mod/tutorials/models/heart"
#json="/users/ysuita/data/ysuita/basenji_mod/tutorials/models/params_small.json"
#data_dir="/users/ysuita/data/ysuita/basenji_mod/data/heart_l131k"

output="/users/ysuita/data/ysuita/basenji_mod/data/GSC_ATAC"
json="/users/ysuita/data/ysuita/basenji_mod/tutorials/models/params_small.json"
data_dir="/users/ysuita/data/ysuita/basenji_mod/data/GSC_ATAC"
/users/ysuita/data/ysuita/basenji/bin/basenji_train.py -o  $output $json $data_dir
