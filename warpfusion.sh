conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
conda env remove --name jupyter -y 
conda create -n jupyter python=3.7 -y
conda activate jupyter
conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch -y
python -m ipykernel install --user
pip install timm==0.4.12
pip install lpips==0.1.3
pip install jupyterlab
sudo tee /etc/systemd/system/brev-jupyter.service > /dev/null << EOF
	[Unit]
	Description=Jupyter Lab
	
	[Service]
	Type=simple
	PIDFile=/run/jupyter-lab.pid
	ExecStart=/home/ubuntu/.conda/envs/jupyter/bin/jupyter lab --no-browser --port=8321 --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''
	User=ubuntu
	WorkingDirectory=/home/ubuntu
	Restart=always
	RestartSec=10
	Environment="PATH=/home/ubuntu/.conda/envs/jupyter/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
	
	[Install]
	WantedBy=multi-user.target
EOF

if systemctl --quiet is-active brev-jupyter.service
then
    echo "brev-jupyter.service is running. Restarting it..."
    sudo systemctl daemon-reload
    sudo systemctl restart brev-jupyter.service
else
    echo "brev-jupyter.service is not running. Enabling and starting it..."
    sudo systemctl enable brev-jupyter.service
    sudo systemctl start brev-jupyter.service
fi
cd /home/ubuntu
wget https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt
