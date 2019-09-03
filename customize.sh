#!/bin/bash

sudo apt-get install -y python3.7 python3-pip virtualenv build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libgeos-dev libxml2 libffi-dev libssl-dev elpa-elpy

# pip for python3.7
curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.7
    
python3.7 -m pip install --user virtualenvwrapper numpy scipy

export PATH=$PATH:"$HOME"/.local/bin
export WORKON_HOME="$HOME"/venvs

if [[ ! -e $WORKON_HOME ]]; then
    mkdir -p $WORKON_HOME
elif [[ ! -d $WORKON_HOME ]]; then
    echo "$WORKON_HOME already exists but is not a directory" 1>&2
fi

export VIRTUALENVWRAPPER_PYTHON="$(command \which python3.7)"
source "$HOME"/.local/bin/virtualenvwrapper.sh

mkvirtualenv 3.7 -p python3.7 -r "$PWD"/requirements.txt

echo "done with python-install !"

