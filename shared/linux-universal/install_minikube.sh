#!/bin/bash


### Simple Standalone Minikube Installer For VM Provisioning ###


# Check for Minikube exit if found
[[ -f /usr/local/bin/minikube ]] && echo "Minikube is already installed." && exit


# Download the Minikube binary
echo "Verify URL availability and download the minikube binary ..."

if [[ $(curl -sSI https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 | head -1 | awk '{print $2}') == "200" ]]; then
   echo "The URL for minikube is available! Beginning download ..."
   cd /usr/local/bin/
   sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &>/dev/null
   sudo chmod 555 /usr/local/bin/minikube
else
   echo "The URL for minikube was not found."
   exit 1
fi 


# Validate installation
[[ -f /usr/local/bin/minikube ]] && echo -e "Minikube installation complete!" || echo "Minikube not found after installation."


# Usage Instructions
echo "With minikube installed, run 'minikube start' at any time to spin up the local Kubernetes instance (dependencies: Docker and Kubectl)."
