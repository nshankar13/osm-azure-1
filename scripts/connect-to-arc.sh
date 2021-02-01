#!/bin/bash

CONNECTEDK8S_VERSION="${CONNECTEDK8S_VERSION:-0.3.5}"

az account set --subscription=$SUBSCRIPTION > /dev/null 2>&1

az extension remove --name connectedk8s

az extension add --source https://shasbextensions.blob.core.windows.net/extensions/connectedk8s-$CONNECTEDK8S_VERSION-py2.py3-none-any.whl -y

az -v 

# enable connected cluster
az connectedK8s connect -n  $CLUSTERNAME -g $RESOURCEGROUP -l $REGION > /dev/null 2>&1
