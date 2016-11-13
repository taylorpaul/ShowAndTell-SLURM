#!/bin/bash

#SBATCH --job-name=MSCOCO${SLURM_ARRAY_TASK_ID}
#SBATCH --time=8:00:00

# To run as an array job, use the following command:
# sbatch --partition=beards --gres=gpu:4 --array=0-0 --constraint=intel --mem=16000 MSCOCO.sh

#TODO Load your modules and profile:
module load cuda/8.0
source /home/thpaul/.bash_profile

# Downloads and pre-preprocesses data for training SHOW AND TELL model
# Have to run in the /im2txt containing WORKSPACE!!!

# Location to save # Location to save the MSCOCO data.
#TODO: Set your MSCOCO_DIR
MSCOCO_DIR="/home/thpaul/work/tf_tools/tensorflow/im2txt/im2txt/data/mscoco"

# Build the preprocessing script.
bazel build im2txt/download_and_preprocess_mscoco

# Run the preprocessing script.
bazel-bin/im2txt/download_and_preprocess_mscoco "${MSCOCO_DIR}"
