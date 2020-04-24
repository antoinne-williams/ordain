#!/bin/bash

### Simple Standalone Maven Installer For VM Provisioning ###

mvn_version="3.6.3"

# Check for Maven; exit if found
[[ -f /usr/local/bin/mvn ]] && exit

echo "Installing Maven ..."

# Create Maven directory
mkdir -p /opt/maven/

# Download Maven 3
wget -q -P /tmp/ http://www.gtlib.gatech.edu/pub/apache/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz

# Unarchive 
tar -zxf /tmp/apache-maven-${mvn_version}-bin.tar.gz --directory /opt/maven/

# Link Maven 3 to common PATH location
ln -sf /opt/maven/apache-maven-${mvn_version}/bin/mvn /usr/local/bin/mvn

# Clean up
rm -f /tmp/apache-maven-${mvn_version}-bin.tar.gz

echo 'Maven installed and linked to "/usr/local/bin/mvn"!'
