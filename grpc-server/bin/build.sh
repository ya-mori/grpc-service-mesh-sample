#!/bin/zsh

docker build \
  -t asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample/grpc-server:latest \
  -f Dockerfile \
  .
