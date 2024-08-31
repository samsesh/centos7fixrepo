#!/bin/bash

# URL of the new repository file
URL="https://raw.githubusercontent.com/samsesh/centos7fixrepo/Localhost/CentOS-Base.repo.1"

# Path to the local repository file
LOCAL_FILE="/etc/yum.repos.d/CentOS-Base.repo"

# Download the new repository file
echo "Downloading the new repository file from $URL..."
curl -o "$LOCAL_FILE" "$URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "File downloaded and replaced successfully."
else
    echo "Error occurred while downloading the new file."
    exit 1
fi

# Update the YUM repositories
echo "Updating YUM repositories..."
yum clean all

echo "Repository update completed successfully."

