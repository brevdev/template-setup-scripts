conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
conda activate base
/home/ubuntu/serverless-template
pip3 install -r requirements.txt

git remote remove origin

