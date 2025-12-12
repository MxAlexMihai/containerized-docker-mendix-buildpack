#!/bin/bash

# Build command for the containerized docker-mendix-buildpack image

# Check if the MXBUILDPACKTAG argument is provided
if [ -z "$1" ]; then
    echo "Error: MXBUILDPACKTAG argument is missing."
    echo "Usage: $0 <MXBUILDPACKTAG>"
    exit 1
fi

MXBUILDPACKTAG=$1

# Build the image passing the build argument
docker build --build-arg MXBUILDPACKTAG=$MXBUILDPACKTAG -t containerized-docker-mendix-buildpack .