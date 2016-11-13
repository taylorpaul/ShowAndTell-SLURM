#!/bin/sh

#SBATCH --ntasks=1
#SBATCH -t 04:00:00               # max runtime is 4 hours
#SBATCH -J  tensorboard_server    # name
#SBATCH -o /work/thpaul/tf_tools/tensorflow/im2txt/tb-%J.out #TODO: Where to save your output

# To run as an array job, use the following command:
# sbatch --partition=beards --array=0-0 tensorboardHam.sh
# squeue --user thpaul

source /home/thpaul/.bash_profile #TODO: Your profile
MODEL_DIR=/work/thpaul/tf_tools/tensorflow/im2txt/im2txt/model #TODO: Your TF model directory

let ipnport=($UID-6025)%65274
echo ipnport=$ipnport

ipnip=$(hostname -i)
echo ipnip=$ipnip

module load cuda/8.0

tensorboard --logdir="${MODEL_DIR}" --port=$ipnport
