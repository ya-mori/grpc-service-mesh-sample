# grpc-service-mesh-sample

## Overview

This is a sample project to demonstrate how to use [gRPC](https://grpc.io/) with [Anthos](https://cloud.google.com/anthos/service-mesh) as a service mesh.


# Setup

## Setup GKE Cluster

ref: https://cloud.google.com/service-mesh/docs/prepare-app-for-anthos-service-mesh#create_a_cluster


## Setup command line
```bash
gcloud config set project <project-id>
gcloud config set account <account>
gcloud auth configure-docker asia-northeast1-docker.pkg.dev
gcloud container clusters get-credentials <cluster-name> --project <project-id> --region <region>
```
