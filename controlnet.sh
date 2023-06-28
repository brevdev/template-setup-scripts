curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git lfs install
cd /home/ubuntu/stable-diffusion-webui/extensions/sd-webui-controlnet/models
git clone https://huggingface.co/lllyasviel/ControlNet-v1-1
mv ControlNet-v1-1/*.pth .
rm -rf ControlNet-v1-1
