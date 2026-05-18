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

curl -sfL https://get.k3s.io |K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--bind-address=${SERVER_IP} --node-ip=${SERVER_IP} --flannel-iface=eth1" sh - && echo "K3s Server has been installed"
# sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/token.txt

sleep 25

# sudo kubectl apply -f /vagrant/confs/app1.yaml
# sudo kubectl apply -f /vagrant/confs/ingress.yaml


sudo kubectl apply -n kube-system -f /vagrant/confs/app1.yaml --validate=false #validate=false empeche la vérification de la bonne syntaxe
# sudo kubectl apply -n kube-system -f /vagrant/confs/app2.yaml --validate=false
# sudo kubectl apply -n kube-system -f /vagrant/confs/app3.yaml --validate=false
sudo kubectl apply -n kube-system -f /vagrant/confs/ingress.yaml --validate=false

echo "[CONFIG FINISHED]"
