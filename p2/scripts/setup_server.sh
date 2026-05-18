#!/bin/bash
set -e

apt-get update
apt-get install -y curl

curl -sfL https://get.k3s.io | \
  INSTALL_K3S_EXEC="server --node-ip=192.168.52.110 --flannel-iface=eth1" \
  sh -

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Attendre que K3s soit prêt
until kubectl get nodes 2>/dev/null | grep -q "Ready"; do
    sleep 2
done

# Appliquer les configurations
kubectl apply -f /vagrant/

echo "server ready"
