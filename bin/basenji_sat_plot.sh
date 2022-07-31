#!/bin/bash
#SBATCH -n 2
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH --gres=gpu:2
#SBATCH --mem=30Gs
#SBATCH -t 12:00:00
# Specify a job name:
#SBATCH -J basenji_test
# Specify an output file
#SBATCH -o slurm-%j.out
#SBATCH -e slurm-%j.err
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,BEGIN
#SBATCH --mail-user=yusuke_suita@brown.edu

module load cudnn/8.2.0 
module load cuda/11.1.1 
module load gcc/10.2
output="/users/ysuita/data/ysuita/basenji_mod/tutorials/output/gata4_sat/plots"
target="/users/ysuita/data/ysuita/basenji_mod/data/heart_wigs.txt"
score="/users/ysuita/data/ysuita/basenji_mod/tutorials/output/gata4_sat/scores.h5"
/users/ysuita/data/ysuita/basenji_mod/bin/basenji_sat_plot.py --png -l 200 -o $output -t $target $score
