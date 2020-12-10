#!/bin/sh
#
#  post container build startup script. This script is run the every time a shell
#  is opened inside the container. This script then checks for a folder in the home folder 
#  of vscode, and if the folder dows not exist, it know to configure the container as a 
#  "FIRST RUN AFTER BUILD/REBUILD"
#  This allows for the setup of ssh credentials, gpg key import and anything else that 
#  might be needed post image creation
#
#
SRC=/app/.vscode
ZDR=$HOME/.z
GPG_KEY="$SRC/psmware.key"
CFGDIR=$HOME/.psmware
if 
   [ ! -d "$ZDR" ]; then
   touch "$ZDR"
fi
if [ ! -d "$CFGDIR" ]; then
    echo "Running the post container build script!"
    echo "......"
    sleep 5
    set -e
    # Setup SSH`
    ansible-playbook -i /app/.devcontainer/.setup /app/.devcontainer/.setup.yml
    # Set up GPG
    gpg --import "$GPG_KEY"
    gpg  --list-secret-keys --keyid-format LONG
    #make the config directory
    mkdir "$CFGDIR"
fi
