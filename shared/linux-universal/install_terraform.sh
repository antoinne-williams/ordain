#!/bin/bash

### Simple Standalone Terraform Installer For VM Provisioning ###

tf_version="0.12.24"

# Check for Terraform; exit if found
[[ -f /usr/local/bin/terraform ]] && echo "Terraform is already installed." && exit 1 || echo "Installing Terraform ${tf_version} ..."

# Create temporary Terraform directory for installation
sudo mkdir -p /opt/terraform
sudo chmod 777 /opt/terraform

# Install archiving software (zip and unzip)
echo "Terraform binaries use the zip utility for archiving. Installing zip and unzip ..."
## Ubuntu
[[ -f /usr/bin/apt ]] && sudo apt install zip unzip -y &>/dev/null
## CentOS
[[ -f /usr/bin/yum ]] && sudo yum install zip unzip -y &>/dev/null

# Download and unpack Terraform
echo "Downloading and unpacking the Terraform binaries to a common PATH ..."
sudo wget https://releases.hashicorp.com/terraform/${tf_version}/terraform_${tf_version}_linux_amd64.zip -P /opt/terraform &>/dev/null
sudo unzip -o /opt/terraform/terraform_${tf_version}_linux_amd64.zip -d /opt/terraform &>/dev/null
sudo mv /opt/terraform/terraform /usr/local/bin/terraform

#Clean up
sudo rm -rf /opt/terraform

# Validate installation
[[ -f /usr/local/bin/terraform ]] && echo -e "Terraform installation complete!" || echo "Terraform not found after installation."
