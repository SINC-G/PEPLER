#!/bin/bash
#                        ##注意参数行开头有#符号
#SBATCH --job-name=PELER  ##自定义作业名
#SBATCH -p debug           ##提交队列，可选gpu/debug
#SBATCH -o ./logs/%j.out        ##标准输出输出到job_id.out
#SBATCH -e ./logs/%j.err        ##标准错误输出到job_id.err
#SBATCH -N 1             ##申请1个计算节点
#SBATCH --cpus-per-task=6 ##申请cpu核数
#SBATCH --gres=gpu:a30mig     ##当申请gpu/debug队列时，指定gpu数量
                         ## gpu类型 --gres=gpu:a30:1 整块a30，显存24GB，队列为gpu
                         ## --gres=gpu:a30mig 1/2的a30，显存12GB，队列为debug
                            

#SBATCH --time=07-00:00:00    ##作业运行最大时长，请合理设置

#####输入您要执行的命令###
### cd $your_working_dir##
### python3 hello.py######
### singularity run $you_img python3 hello.py
###例如##################
module load miniconda3
source activate pytorch1.12-cuda

./pepler-d.sh