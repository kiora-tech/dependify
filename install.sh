#!/bin/bash

# Check for dependencies
command -v curl >/dev/null 2>&1 || { echo >&2 "I require 'curl' but it's not installed. Aborting."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo >&2 "I require 'jq' but it's not installed. Aborting."; exit 1; }

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 PROJECT_ID PROJECT_PATH"
    exit 1
fi

# Define your variables here
TOKEN="${GITLAB_TOKEN}"
PROJECT_ID="$1"
PROJECT_PATH="$2"
API_URL="https://$3/api/v4"

# Fetch the latest release
RELEASE=$(curl --header "PRIVATE-TOKEN: $TOKEN" "$API_URL/projects/$PROJECT_ID/releases" | jq -r '.[0]')
if [ $? -ne 0 ]; then
    echo "Error fetching the latest release. Please check your TOKEN and PROJECT_ID."
    exit 1
fi

PROJECT_URL_VENDOR=$(echo $RELEASE | jq -r '.assets.links[] | select(.name == "project-api").url')

# Download the project
curl --header "PRIVATE-TOKEN: $TOKEN" -LJO $PROJECT_URL_VENDOR
if [ $? -ne 0 ]; then
    echo "Error downloading the project."
    exit 1
fi

# Create project path
mkdir -p $PROJECT_PATH
if [ $? -ne 0 ]; then
    echo "Error creating project path."
    exit 1
fi

# Extract the project
tar -xzf project.tar.gz -C $PROJECT_PATH
if [ $? -ne 0 ]; then
    echo "Error extracting the project."
    exit 1
fi

# Remove the tar.gz file
rm project.tar.gz
if [ $? -ne 0 ]; then
    echo "Error removing the project tar.gz file."
    exit 1
fi
