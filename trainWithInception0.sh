#!/bin/bash

#SBATCH --job-name=tensorflowShowandTell${SLURM_ARRAY_TASK_ID}
#SBATCH --time=504:00:00

# To run as an array job, use the following command:
# sbatch --partition=beards --gres=gpu:1 --array=0-1 --mem=64000 --constraint=intel trainWithInception.sh

#TODO: Load your modules and your profile
module load cuda/8.0
source /home/thpaul/.bash_profile

#TODO: Update your Base Directory:
WORK=/work/thpaul/tf_tools/tensorflow/im2txt

#TODO: Directory containing preprocessed MSCOCO data.
MSCOCO_DIR="/work/thpaul/tf_tools/tensorflow/im2txt/im2txt/data/mscoco"

#TODO: Inception v3 checkpoint file.
INCEPTION_CHECKPOINT="/work/thpaul/tf_tools/tensorflow/im2txt/im2txt/data/inception_v3.ckpt"

#TODO: Directory to save the model.
MODEL_DIR="/work/thpaul/tf_tools/tensorflow/im2txt/im2txt/model"

echo "Starting Bazel Train from `pwd`"

bazel build -c opt im2txt/...

# Run the training script.
bazel-bin/im2txt/train \
  --input_file_pattern="${MSCOCO_DIR}/train-?????-of-00256" \
  --train_dir="${MODEL_DIR}/train" \
  --train_inception=true \
  --number_of_steps=3000000
