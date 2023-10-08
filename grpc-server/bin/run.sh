#!/bin/sh

docker run -it -v ${PWD}/grpc_server:/grpc_server -p8001:8001 -p8000:8000 --rm grpc-server
