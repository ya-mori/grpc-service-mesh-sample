#!/bin/zsh

IMAGE_TAG=$(git rev-parse --short HEAD)
docker build -t asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample/grpc-client:"$IMAGE_TAG" -f Dockerfile .
docker push asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample/grpc-client:"$IMAGE_TAG"
