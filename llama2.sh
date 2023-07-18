#!/bin/bash

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

chmod +x ./download.sh
pip install -e .
