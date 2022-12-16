#!/bin/bash

set -eo pipefail

conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
##### Node v16.x + npm #####
(echo ""; echo "##### Node v16.x + npm #####"; echo "";)
sudo apt install ca-certificates
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
conda create --name riffusion-inference python=3.9 -y
conda activate riffusion-inference
cd ~/riffusion-inference
python -m pip install -r requirements.txt
sudo apt install ffmpeg -y

cd ~/riffusion-app 
npm install


echo "
RIFFUSION_FLASK_URL=http://localhost:3013/run_inference/
NEXT_PUBLIC_RIFFUSION_USE_BASETEN=false" > .env.local