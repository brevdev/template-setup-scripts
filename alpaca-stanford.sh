#!/bin/bash

set -eo pipefail

conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa

sudo apt update
sudo apt install -y python3.10
conda create --name py310 python=3.10 -y
conda activate py310
pip install -r requirements.txt 
pip install accelerate
sudo chown -R ubuntu:ubuntu /home/ubuntu/.config/