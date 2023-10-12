#!/bin/zsh

IMAGE_TAG=$(git rev-parse --short HEAD)
IMAGE_URI=asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample

pushd k8s/overlays/prd
kustomize edit set image \
  grpc-service-mesh-sample/grpc-client="$IMAGE_URI"/grpc_client:"$IMAGE_TAG" \
  grpc-service-mesh-sample/grpc-server="$IMAGE_URI"/grpc_server:"$IMAGE_TAG"
popd

#TODO(ya-mori): Remove dry-run
kubectl apply --dry-run=server -k k8s/overlays/prd

