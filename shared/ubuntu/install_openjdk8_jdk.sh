#!/bin/bash


### Simple Standalone OpenJDK 8 JDK Java Installer For VM Provisioning ###


# Check for Java; exit if found
[[ -f /usr/bin/java ]] && exit


# Update Packages via APT and Download Java JDK 8
echo "Updating Packages via APT and Installing OpenJDK 8 JDK Java..."
apt update -y &>/dev/null && apt upgrade -y &>/dev/null && apt install -y openjdk-8-jdk &>/dev/null


# Validate installation
[[ -f /usr/bin/java ]] && echo -e "Java installation complete!" || echo "Java not found after installation. Exiting ..." && exit


# Clean up
apt clean -y &>/dev/null


echo 'OpenJDK 8 JDK Java installed!'
