#!/bin/bash

set -eu

BASE=$(dirname "$(cd "$(dirname "$0")"; pwd)")
CONFIG="$BASE/config"

rm -rf ~/.config
ln -sf "${CONFIG}/.config/" ~

ln -sf "${CONFIG}/.zprofile" ~/.zprofile
ln -sf "${CONFIG}/.zshrc" ~/.zshrc

ln -sf "${CONFIG}/.gitconfig" ~/.gitconfig

rm -rf ~/.vim
ln -sf "${CONFIG}/.vim" ~/.vim
ln -sf "${CONFIG}/.vimrc" ~/.vimrc

