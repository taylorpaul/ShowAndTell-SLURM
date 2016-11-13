# Run the evaluation script. This will run in a loop, periodically loading the
# latest model checkpoint file and computing evaluation metrics.
#TODO: Base Directory:
WORK=/work/thpaul/tf_tools/tensorflow/im2txt
cd $WORK
#Directory containing preprocessed MSCOCO data.
MSCOCO_DIR="${WORK}/im2txt/data/mscoco"

# Directory to save the model.
MODEL_DIR="${WORK}/im2txt/model"

echo "Starting Bazel Evaluate from `pwd`"

bazel-bin/im2txt/evaluate \
  --input_file_pattern="${MSCOCO_DIR}/val-?????-of-00004" \
  --checkpoint_dir="${MODEL_DIR}/train" \
  --eval_dir="${MODEL_DIR}/eval"
