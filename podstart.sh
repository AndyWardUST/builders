#!/bin/bash
set -e

if [ "$1" != "" ]; then
    echo "Starting node and python agents " $1
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
	-e AZP_AGENT_NAME=Node_$1 \
	-e AZP_POOL='Node Pool' nodeagent
podman run -d \
        -e AZP_URL=https://dev.azure.com/POCSchroders/ \
        -e AZP_TOKEN=$2 \
        -e AZP_AGENT_NAME=Python_$1 \
        -e AZP_POOL='Python Pool' pythonagent
podman run -d \
        -e AZP_URL=https://dev.azure.com/POCSchroders/ \
        -e AZP_TOKEN=$2 \
        -e AZP_AGENT_NAME=NET31_$1 \
        -e AZP_POOL='Net 31 Pool' net31agent
podman run -d \
        -e AZP_URL=https://dev.azure.com/POCSchroders/ \
        -e AZP_TOKEN=$2 \
        -e AZP_AGENT_NAME=NET22_$1 \
        -e AZP_POOL='Net 22 Pool' net22agent
