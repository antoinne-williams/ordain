#!/bin/bash

plugins=(
vagrant-compose
vagrant-disksize
vagrant-env
vagrant-scp
vagrant-sshfs
vagrant-vbguest
virtualbox
)

echo -e "Starting Vagrant plugin installation...\n"

for i in ${plugins[@]}; do
  if [[ $(vagrant plugin list | awk '{print $1}' | grep $i | wc -l) -eq 1 ]]; then
    echo "The $i plugin is already installed. Skipping..."
  else
    echo "The $i plugin not currently installed. Starting installation..."
    vagrant plugin install $i
  fi
done

echo -e "\nInstallation complete!"
