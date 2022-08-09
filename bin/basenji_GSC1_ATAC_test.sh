#!/bin/bash
#SBATCH -n 2
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH --gres=gpu:2
#SBATCH --mem=30Gs
#SBATCH -t 12:00:00
# Specify a job name:
#SBTACH --job-name=basenji_test
#SBATCH -J "basenji_test_ATAC_GSC1"
# Specify an output file
#SBATCH -o slurm-%J.out
#SBATCH -e slurm-%J.err
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,BEGIN
#SBATCH --mail-user=yusuke_suita@brown.edu

module load cudnn/8.2.0 
module load cuda/11.1.1 
module load gcc/10.2
source /users/ysuita/data/ysuita/bin/activate

output="/users/ysuita/data/ysuita/basenji_mod/data/GSC_ATAC"
#train_model="/gpfs/data/ntapinos/ysuita/basenji_mod/data/GSC_ATAC/seqs_cov/0.h5"
train_model="/gpfs/data/ntapinos/ysuita/basenji_mod/data/GSC_ATAC/seqs_cov/ATAC_GSC1.h5"
test_parameters="/users/ysuita/data/ysuita/basenji_mod/tutorials/models/params_small.json"
test_inputdata="/users/ysuita/data/ysuita/basenji_mod/data/GSC_ATAC"

#/users/ysuita/data/ysuita/basenji_mod/bin/basenji_test.py --ai 0,1,2 -o $output --rc --shifts "1,0,-1" $test_parameters $train_model $test_inputdata
/users/ysuita/data/ysuita/basenji_mod/bin/basenji_test.py --ai 0 -o $output --rc --shifts "1,0,-1" $test_parameters $train_model $test_inputdata
