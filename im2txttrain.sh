#!/bin/bash

#SBATCH --job-name=tensorflowShowandTell${SLURM_ARRAY_TASK_ID}
#SBATCH --time=504:00:00

# To run as an array job, use the following command:
# sbatch --partition=beards --gres=gpu:1 --array=0-1 --mem=64000 --constraint=intel im2txttrain.sh

#TODO: Load your modules and your profile
module load cuda/8.0
source /home/thpaul/.bash_profile

#TODO: Set Base Directory and Scripts Directory:
WORK=/work/thpaul/tf_tools/tensorflow/im2txt
SCRIPTS="${WORK}/NLP_Project_Scripts"

# Directory containing preprocessed MSCOCO data.
MSCOCO_DIR="${WORK}/im2txt/data/mscoco"

# Inception v3 checkpoint file.
INCEPTION_CHECKPOINT="${WORK}/im2txt/data/inception_v3.ckpt"

# Directory to save the model.
MODEL_DIR="${WORK}/im2txt/model"

# Build the model.
cd $WORK
echo "Starting Task! tensorflowShowandTell${SLURM_ARRAY_TASK_ID}.sh from `pwd`"
(exec ${SCRIPTS}/tensorflowShowandTell${SLURM_ARRAY_TASK_ID}.sh)

# MODEL_DIR="${WORK}/im2txt/model"
# # Run a TensorBoard server.
# tensorboard --logdir="${MODEL_DIR}"
