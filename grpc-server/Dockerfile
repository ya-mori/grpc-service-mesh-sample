FROM nvcr.io/nvidia/tritonserver:23.09-py3

COPY ./grpc_server /grpc_server

ENTRYPOINT tritonserver --model-repository=/grpc_server
