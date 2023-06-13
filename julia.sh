#!/bin/bash

set -eo pipefail

####################################################################################
##### Specify software and dependencies that are required for this project     #####
#####                                                                          #####
##### Note:                                                                    #####
##### The working directory is /home/brev/<PROJECT_FOLDER_NAME>. Execution of  #####
##### this file happens at this level.                                         #####
####################################################################################

#### Juliaup #####
(echo ""; echo "##### JuliaUp #####"; echo "";)
curl -fsSL https://install.julialang.org | sh -s -- -y

julia setup.jl