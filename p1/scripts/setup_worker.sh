#!/bin/bash
while [ ! -f /vagrant/node-token ]; do
	sleep 3
done

NODE_TOKEN=$(cat /vagrant/node-token)
SERVER_IP="192.168.56.110"

apt-get update && apt-get install -y curl && apt-get install -y virtualbox-guest-utils
curl -sfL https://get.k3s.io | \
	K3S_URL="https://${SERVER_IP}:6443" \
	K3S_TOKEN="${NODE_TOKEN}" \
	sh -
echo "worker connected to cluster"
