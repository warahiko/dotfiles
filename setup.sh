#!/bin/bash

set -eu

BASE=$(dirname $0)
JOB="$BASE/job"

STEP=0

header() {
  (( STEP++ ))
  printf "\e[1m>>> Step ${STEP}: Setup $@ ... \e[m\n"
}

check() {
  if $@; then
    printf "\n\e[32;1m>>> Step ${STEP}: Success ✅\e[m\n\n"
  else
    printf "\n\e[31;1m>>> Step ${STEP}: Fail ❌\e[m\n\n"
    exit 1
  fi
}

header "Rosetta"
check JOB/setup_rosetta.sh

# This also installs CommandLineTools for Xcode.
header "Homebrew"
check JOB/setup_homebrew.sh

header "config files"
check JOB/setup_config_files.sh

header "SSH key for GitHub"
check JOB/setup_ssh_for_github.sh

header "Mac defaults"
check JOB/setup_mac_defaults.sh

header "Iceberg"
check JOB/setup_iceberg.sh

header "Vim"
check JOB/setup_vim.sh

header "Zsh"
check JOB/setup_zsh.sh

header "Other"
check JOB/setup_other.sh

