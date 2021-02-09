#!/bin/bash

source .env

RELEASE_NAMESPACE="${RELEASE_NAMESPACE:-arc-osm-system}"
EXTENSION_NAME="${EXTENSION_NAME:-osm}"
EXTENSION_TYPE="${EXTENSION_TYPE:-Microsoft.openservicemesh}"
EXTENSION_SETTINGS=$1
K8S_EXTENSION_VERSION="${K8S_EXTENSION_VERSION:-0.1PP.12}"

<<<<<<< HEAD
export RESOURCEID="subscriptions/$SUBSCRIPTION/resourceGroups/$RESOURCEGROUP/providers/Microsoft.Kubernetes/connectedClusters/$CLUSTERNAME"

echo "Azure Resource ID: $RESOURCEID"
=======
az account set --subscription=$SUBSCRIPTION > /dev/null 2>&1

az extension remove --name k8s-extension

git clone https://github.com/Azure/azure-arc-kubernetes-preview

az extension add --source ./extensions/k8s_extension-$K8S_EXTENSION_VERSION-py2.py3-none-any.whl --yes
>>>>>>> Add e2e for upgrade

if [[ -z "$EXTENSION_SETTINGS" ]]; then
    az k8s-extension create --cluster-name $CLUSTERNAME --resource-group $RESOURCEGROUP --cluster-type connectedClusters --extension-type Microsoft.openservicemesh --scope cluster --release-train staging --name $EXTENSION_NAME --release-namespace arc-osm-system --version $CHECKOUT_TAG
else 
    az k8s-extension create --cluster-name $CLUSTERNAME --resource-group $RESOURCEGROUP --cluster-type connectedClusters --extension-type Microsoft.openservicemesh --scope cluster --release-train staging --name $EXTENSION_NAME --release-namespace arc-osm-system --version $CHECKOUT_TAG --configuration-protected-settings-file $EXTENSION_SETTINGS
fi

<<<<<<< HEAD
az account set --subscription="$SUBSCRIPTION" > /dev/null 2>&1

# enable the OSM Extension
az rest \
   --method PUT \
   --uri "https://management.azure.com/$RESOURCEID/providers/Microsoft.KubernetesConfiguration/extensions/$EXTENSION_NAME?api-Version=$API_VERSION" \
   --body @$EXTENSION_SETTINGS \
   --debug
=======
>>>>>>> Add e2e for upgrade
