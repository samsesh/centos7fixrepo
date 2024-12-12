#!/bin/bash

# Variables
EP_URL="https://github.com/samsesh/centos7fixrepo/raw/refs/heads/Localhost/epel.repo"
EP_LOCAL_FILE="/etc/yum.repos.d/epel.repo"
URL="https://raw.githubusercontent.com/samsesh/centos7fixrepo/Localhost/CentOS-Base.repo.1"
LOCAL_FILE="/etc/yum.repos.d/CentOS-Base.repo"

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Exiting."
    exit 1
fi

# Check if the system is CentOS 7
os_version=$(cat /etc/os-release | grep -i "centos" | grep -i "7")
if [ -z "$os_version" ]; then
    echo "This script is intended for CentOS 7. Exiting."
    exit 1
fi

# Backup the old EPEL repo file if it exists
if [ -f "$EP_LOCAL_FILE" ]; then
    echo "Backing up the old EPEL repo file to $EP_LOCAL_FILE.bk..."
    cp "$EP_LOCAL_FILE" "$EP_LOCAL_FILE.bk"
fi

# Download the new EPEL repository file
echo "Downloading the new EPEL repository file from $EP_URL..."
curl -o "$EP_LOCAL_FILE" "$EP_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "EPEL repository file downloaded and replaced successfully."
else
    echo "Error occurred while downloading the EPEL repository file. Exiting."
    exit 1
fi

# Backup the old CentOS Base repo file if it exists
if [ -f "$LOCAL_FILE" ]; then
    echo "Backing up the old CentOS Base repo file to $LOCAL_FILE.bk..."
    cp "$LOCAL_FILE" "$LOCAL_FILE.bk"
fi

# Download the new CentOS Base repository file
echo "Downloading the new CentOS Base repository file from $URL..."
curl -o "$LOCAL_FILE" "$URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "CentOS Base repository file downloaded and replaced successfully."
else
    echo "Error occurred while downloading the CentOS Base repository file. Exiting."
    exit 1
fi

# Update the YUM repositories
echo "Updating YUM repositories..."
yum clean all

echo "Repository update completed successfully."
