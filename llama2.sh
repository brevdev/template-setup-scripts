#!/bin/bash

if ! command -v conda &>/dev/null; then
  echo "Conda not installed. Installing it..."
    
  # Define variables for the Anaconda installation
    # LATEST_CONDA_INSTALLER=$(curl -s https://repo.anaconda.com/archive/ | grep -o -E 'Anaconda3-.*-Linux-x86_64.sh"' | head -n 1 | tr -d '"')
  # Instead of most recent installer, let's install 4.10.1 to match the other machines: "Anaconda3-2021.05-Linux-x86_64.sh"

  # Download the Anaconda installer
  wget -q "https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh" -O "Anaconda3-2021.05-Linux-x86_64.sh"

  # Execute the installer
  sudo bash Anaconda3-2021.05-Linux-x86_64.sh -b -p /opt/conda

  # Add Anaconda to the system PATH
  export PATH="/opt/conda/:$PATH" >> $HOME/.bashrc
  source $HOME/.bashrc
  CONDA_ENVS_PATH_PREFIX="$HOME/.conda/"

  echo "Successfully installed conda."
fi

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

cd /home/ubuntu/llama
chmod +x ./download.sh
pip install -e .
pip install fire
