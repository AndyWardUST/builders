#!/bin/bash
set -e

if [ "$1" != "" ]; then
    echo "Starting node and python agents number" $1
else
    echo "Please supply agent number"
    exit 1
fi

if [ "$2" == "" ]; then
    echo "needs a PAT Token"
    exit 1
fi

podman run -d \
	-e AZP_URL=https://dev.azure.com/POCSchroders/ \
	-e AZP_TOKEN=$2 \
	-e AZP_AGENT_NAME=Node$1 \
	-e AZP_POOL='Node Pool' nodeagent
podman run -d \
        -e AZP_URL=https://dev.azure.com/POCSchroders/ \
        -e AZP_TOKEN=$2 \
        -e AZP_AGENT_NAME=Python$1 \
        -e AZP_POOL='Python Pool' pythonagent
