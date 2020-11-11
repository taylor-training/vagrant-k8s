#!/bin/bash

$host=`hostname`
echo "Kubernetes Worker Node Bootstrap Script for Ubuntu for $host"

nodeNumber=$1
echo "Setting up node $nodeNumber"

whoami

kubeadm version -o short
kubelet --version
kubectl version --short

hostnamectl set-hostname kubernetes-worker-$nodeNumber

if [ -f "/vagrant/k8s-join.sh" ]; then
  /vagrant/k8s-join.sh
else
  echo "[ERROR] Unable to find Kubernetes join script"
  exit 1
fi

echo "Complete"
