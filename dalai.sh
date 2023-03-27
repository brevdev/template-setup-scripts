sudo apt update
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm i -g npx

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc

nvm i 18
nvm use 18
# git clone https://github.com/cocktailpeanut/dalai
cd ~/dalai
sudo apt-get install build-essential python3-venv -y
npm i 
# npm ci
node setup.js
./dalai alpaca install 7B
# ./dalai serve