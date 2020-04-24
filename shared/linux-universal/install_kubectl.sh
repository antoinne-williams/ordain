#!/bin/bash


### Simple Standalone Kubectl Installer For VM Provisioning ###


kubectl_version="1.18.0"


# Check for Kubectl; exit if found
[[ -f /usr/local/bin/kubectl ]] && echo "Kubectl is already installed." && exit


# Download the Kubectl binary
echo "Verify URL availability and download the kubectl binary ..."

if [[ $(curl -sSI https://storage.googleapis.com/kubernetes-release/release/v${kubectl_version}/bin/linux/amd64/kubectl | head -1 | awk '{print $2}') == "200" ]]; then
   echo "The URL for kubectl $kubectl_version is available! Beginning download ..."
   cd /usr/local/bin/
   sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v${kubectl_version}/bin/linux/amd64/kubectl &>/dev/null
   sudo chmod 555 /usr/local/bin/kubectl
else
   echo "The URL for kubectl $kubectl_version was not found."
   exit 1
fi 

# Validate installation
[[ -f /usr/local/bin/kubectl ]] && echo -e "Kubectl installation complete!" || echo "Kubectl not found after installation."
