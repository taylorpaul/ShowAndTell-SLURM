# Downloads InceptionV3 checkpoint for SHOW AND TELL model
# Location to save the Inception v3 checkpoint.

#TODO: Insert your im2txt data directory:
INCEPTION_DIR="/work/thpaul/tensorflow/im2txt/im2txt/data"
mkdir -p ${INCEPTION_DIR}

wget "http://download.tensorflow.org/models/inception_v3_2016_08_28.tar.gz"
tar -xvf "inception_v3_2016_08_28.tar.gz" -C ${INCEPTION_DIR}
rm "inception_v3_2016_08_28.tar.gz"
