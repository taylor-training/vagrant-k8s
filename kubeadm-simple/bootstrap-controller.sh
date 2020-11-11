#!/bin/bash

IP_ADDR=10.8.8.10
POD_CIDR=172.18.0.0/16

$host=`hostname`
echo "Kubernetes Controller Bootstrap Script for Ubuntu for $host"

whoami

if [ -f "/vagrant/k8s-join.sh" ]; then
  echo "Deleting previous join script"
  rm -f /vagrant/k8s-join.sh
fi

kubeadm version -o short
kubelet --version
kubectl version --short

hostnamectl set-hostname kubernetes-controller

echo
kubeadm init --apiserver-advertise-address=$IP_ADDR --pod-network-cidr $POD_CIDR
kubeadm token create --print-join-command > /vagrant/k8s-join.sh

echo "Setup local execution"
mkdir -p /root/.kube
cp -i /etc/kubernetes/admin.conf /root/.kube/config
mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube

echo "Install Helm"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

echo "Complete"
