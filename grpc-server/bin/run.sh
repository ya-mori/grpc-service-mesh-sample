#!/bin/zsh

docker run -it \
  -v ${PWD}/grpc_server:/grpc_server \
  -p8000:8000 \
  -p8001:8001 \
  -p8002:8002 \
  --rm asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample/grpc-server:latest
