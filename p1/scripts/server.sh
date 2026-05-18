#!/bin/bash
SERVER_IP=$1

echo "[INSTALLATION OF K3S SERVER]"

sudo mkdir /vagrant/confs
sudo touch /vagrant/confs/token.txt

apt-get install -y \
    curl \
    iptables \
    iproute2 \
    nftables \
    ca-certificates

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--bind-address=${SERVER_IP} --flannel-iface=eth1" sh - && echo "K3s Server has been installed"
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/token.txt
