#!/bin/bash

set -eu

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap homebrew/bundle
brew upgrade
brew bundle install --file "$(dirname $0)/../Brewfile"
brew cleanup

