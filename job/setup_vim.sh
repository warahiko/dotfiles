#!/bin/bash

set -eu

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    >/dev/null 2>&1

echo "Launch vim and run \":PlugInstall\"."

