#!/bin/zsh

docker build \
  -t asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample/grpc-server:"$IMAGE_TAG" \
  -f ./grpc-server/Dockerfile \
  ./grpc-server
