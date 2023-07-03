cd
git clone https://github.com/ggerganov/llama.cpp

sudo apt update
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt-get install aptitude -y
sudo aptitude install npm -y
sudo npm i -g npx

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc

mkdir /home/ubuntu/dalai/tmp/models

nvm i 18
nvm use 18
cd ~/dalai
sudo apt-get install build-essential python3-venv -y
npm i 
node setup.js
  
npx dalai llama install 7B

# Move models to other repo be converted 
mv ~/dalai/llama/models/* ~/llama.cpp/models/

# install Python dependencies
cd ~/llama.cpp
python3 -m pip install -r requirements.txt

# convert the 7B model to ggml FP16 format
python3 convert.py models/7B/

make

# quantize the model to 4-bits (using q4_0 method)
./quantize ./models/7B/ggml-model-f16.bin ./models/7B/ggml-model-q4_0.bin q4_0

# run the inference
#./main -m ./models/7B/ggml-model-q4_0.bin -n 128 -p "Prompt goes here!" -i

