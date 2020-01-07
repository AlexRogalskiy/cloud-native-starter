#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying postgres cluster

  cd ${root_folder}/scripts
  kubectl create -f postgres-cluster.yaml -n operators
  
  _out Done deploying postgres cluster
  _out Wait until the pod has been started: kubectl get postgresql
}

setup