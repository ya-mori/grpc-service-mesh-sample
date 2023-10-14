#!/bin/zsh

IMAGE_TAG=$(git rev-parse --short HEAD)
IMAGE_URI=asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample

pushd k8s/overlays/prd || exit
kustomize edit set image \
  grpc-service-mesh-sample/grpc-client="$IMAGE_URI"/grpc-client:"$IMAGE_TAG" \
  grpc-service-mesh-sample/grpc-server="$IMAGE_URI"/grpc-server:"$IMAGE_TAG"
popd || exit

kubectl apply --dry-run=server -k k8s/overlays/prd
