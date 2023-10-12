#!/bin/zsh

IMAGE_TAG=$(git rev-parse --short HEAD)
docker run -it \
  -v ${PWD}/grpc_server:/grpc_server \
  -p8001:8001 \
  -p8000:8000 \
  --rm asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample/grpc-server:"$IMAGE_TAG"
