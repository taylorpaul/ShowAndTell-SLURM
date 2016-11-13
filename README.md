# ShowAndTell-SLURM
My reproduction of Google's im2txt (or Show and Tell) model using scripts for conducting training and evaluation on a SLURM cluster.

## Getting Started:

I followed this [tutorial](https://github.com/tensorflow/models/tree/master/im2txt) from the im2text repository.
In order to develop the scripts included in this repository for training the model using SLURM. Start there and
run the appropriate script. Each script has TODO's requiring updates for your directories, etc. Here are the basic steps to reproduce the training once all dependecies are installed(Need help installing TF on CENTOS 6.8 without root? Check [here](https://gist.github.com/taylorpaul/3e4e405ffad1be8355bf742fa24b41f0)):

1.  Clone the im2txt model into your desired directory
2.  Download and process the MSCOCO data using `MSCOCO.sh`
3.  Download the InceptionV3 checkpoint using `get_inception.sh`
4.  Modify `tensorflowShowandTell0.sh` and `tensorflowShowandTell1.sh` for your system.
5.  Initialize the training and evaluation using `im2txttrain.sh` to call the scripts modified in step 4.
6.  After 5,000 steps complete, run `tensorboard.sh` to start a tensorboard server.
7. Follow this [gist](https://gist.github.com/taylorpaul/250ee3ed2524e8c28ee7c58ed656a5b9) to access the server.
8. You can modify and run `showAndTellClassify.sh` to test your model when the script from step 5 completes.
9. Run `trainWithInception.sh`(TODO: Pending updates!!!) to complete an additional 2 Million training steps including updates to the Inception network. 
