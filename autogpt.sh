#!/bin/bash

set -eo pipefail

# Setup for https://github.com/Significant-Gravitas/Auto-GPT
####################################################################################
##### Specify software and dependencies that are required for this project     #####
####################################################################################


conda create -n python310 python=3.10 -y
conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"

if ! grep -q 'conda activate python310' ~/.zshrc; then
   echo 'conda activate python310' >> ~/.zshrc
fi

if ! grep -q 'conda activate python310' ~/.bashrc; then
   echo 'conda activate python310' >> ~/.bashrc
fi

conda activate python310
pip install -r ../Auto-GPT/requirements.txt

cp ../Auto-GPT/.env.template ../Auto-GPT/.env
