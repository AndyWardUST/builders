#!/bin/bash
set -e

if [ "$1" != "" ]; then
    echo "Starting node and python agents number" $1
else
    echo "Please supply agent number"
    exit 1
fi


podman run -d \
	-e AZP_URL=https://dev.azure.com/POCSchroders/ \
	-e AZP_TOKEN=uh6zh5ppj37nuhfps4qwshfgctp625ul7wbvxe3jz6badiw6y3ca \
	-e AZP_AGENT_NAME=Node$1 \
	-e AZP_POOL='Node Pool' nodeagent
podman run -d \
        -e AZP_URL=https://dev.azure.com/POCSchroders/ \
        -e AZP_TOKEN=uh6zh5ppj37nuhfps4qwshfgctp625ul7wbvxe3jz6badiw6y3ca \
        -e AZP_AGENT_NAME=Python$1 \
        -e AZP_POOL='Python Pool' pythonagent
