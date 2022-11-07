conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"

# so now we'd have the conda environment:
pip3 install -r requirements.txt


# then we'd also need to remove the git remote and get the user to create a new one
git remote remove origin

