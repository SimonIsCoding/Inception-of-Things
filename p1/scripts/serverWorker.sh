#!/bin/bash



echo "[INSTALLATION OF K3S AGENT]"

SERVER_IP=$1
SERVER_PORT=6443
SERVER_URL="https://${SERVER_IP}:${SERVER_PORT}"
K3S_TOKEN_FILE="/vagrant/confs/token.txt"


apt-get install -y \
    curl \
    iptables \
    iproute2 \
    nftables \
    ca-certificates


curl -sfL https://get.k3s.io | K3S_URL=${SERVER_URL} K3S_TOKEN_FILE=${K3S_TOKEN_FILE}  INSTALL_K3S_EXEC="--flannel-iface=eth1" sh - && echo "K3s agent has been installed"
