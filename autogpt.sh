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
conda activate python310
pip install -r requirements.txt

cp .env.template .env