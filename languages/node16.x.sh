#!/bin/bash

set -eo pipefail
##### Node v16.x + npm #####
(echo ""; echo "##### Node v16.x + npm #####"; echo "";)
sudo apt install ca-certificates
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs