#!/bin/bash

set -eu

if [ -e ~/.ssh/github ]; then
  echo "The file ~/.ssh/github already exists."
  exit 0
fi

mkdir -p ~/.ssh

echo "
Host github.com
  HostName github.com
  IdentityFile ~/.ssh/github
  User git
" > ~/.ssh/config

ssh-keygen -t ed25519 -f ~/.ssh/github -N "" -C "warahiko@gmail.com"

echo "SSH public key for GitHub (copied to clipboard)"
echo "--------------------"
pbcopy < ~/.ssh/github.pub
pbpaste
echo "--------------------"

