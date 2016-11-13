#TODO: Update your Base Directory:
WORK=/work/thpaul/tf_tools/tensorflow/im2txt
cd $WORK

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
  --inception_checkpoint_file="${INCEPTION_CHECKPOINT}" \
  --train_dir="${MODEL_DIR}/train" \
  --train_inception=false \
  --number_of_steps=1000000
