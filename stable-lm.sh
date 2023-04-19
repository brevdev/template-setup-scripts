#!/bin/bash

set -eo pipefail

conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
conda activate base

pip install accelerate bitsandbytes transformers