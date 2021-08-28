#!/bin/bash

docker run --rm -it \
	-v //var/run/docker.sock:/var/run/docker.sock \
	-v /$(pwd):/docker-mendix-buildpack/project \
	--name cntnr-dmb \
	containerized-docker-mendix-buildpack
