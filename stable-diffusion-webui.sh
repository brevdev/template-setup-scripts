conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
conda create -n py310 python=3.10
echo "conda activate py310" >> ~/.bashrc
echo "conda activate py310" >> ~/.zshrc
source ~/.bashrc
source ~/.zshrc
conda activate py310
pip install xformers
# sudo apt install wget git python3 python3-venv -y
# cd /home/ubuntu/stable-diffusion-webui
# ./webui.sh
