#!/bin/bash

set -eo pipefail
source /etc/bash.bashrc
/opt/conda/bin/conda init zsh
/opt/conda/bin/conda init bash 
eval "$(/opt/conda/bin/conda shell.bash hook)"
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y

sudo apt update
sudo apt install -y python3.10
/opt/conda/bin/conda create --name py310 python=3.10 -y
/opt/conda/bin/conda activate py310
pip install -r requirements.txt 
pip install accelerate
sudo chown -R ubuntu:ubuntu /home/ubuntu/.config/
pip install protobuf==3.20.3
wget https://raw.githubusercontent.com/huggingface/transformers/main/src/transformers/models/llama/convert_llama_weights_to_hf.py