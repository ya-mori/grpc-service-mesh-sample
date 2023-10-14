#!/bin/zsh

IMAGE_TAG=$(git rev-parse --short HEAD)
IMAGE_URI=asia-northeast1-docker.pkg.dev/"$GOOGLE_CLOUD_PROJECT"/grpc-service-mesh-sample

docker build -t "$IMAGE_URI"/grpc-client:"$IMAGE_TAG" -f ./grpc-client/Dockerfile ./grpc-client
docker push "$IMAGE_URI"/grpc-client:"$IMAGE_TAG"

docker build -t "$IMAGE_URI"/grpc-server:"$IMAGE_TAG" -f ./grpc-server/Dockerfile ./grpc-server
docker push "$IMAGE_URI"/grpc-server:"$IMAGE_TAG"
