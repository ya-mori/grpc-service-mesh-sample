# grpc-service-mesh-sample

## Overview
This is a sample project to demonstrate how to use [gRPC](https://grpc.io/) with [Anthos](https://cloud.google.com/anthos/service-mesh) as a service mesh.


# Setup

## Setup GKE Cluster
ref: https://cloud.google.com/service-mesh/docs/prepare-app-for-anthos-service-mesh#create_a_cluster

## Setup command line
```bash
export GOOGLE_CLOUD_PROJECT=<project-id>
gcloud config set project <project-id>
gcloud config set account <account>
gcloud auth configure-docker asia-northeast1-docker.pkg.dev
gcloud container clusters get-credentials <cluster-name> --project <project-id> --region <region>
```


# Build and Deploy

## Deploy to GKE
```bash
kubectl config use-context gke_<project-id>_<region>_<cluster-name>
sh bin/build.sh
sh bin/deploy.sh
kubectl apply -k k8s/overlays/prd
```
