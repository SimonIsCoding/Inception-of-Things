#!/bin/bash

SERVER_IP="192.168.56.110"

while [ ! -f /vagrant/node-token ]
do
	sleep 2
done

NODE_TOKEN=$(cat /vagrant/node-token)

apt-get update
apt-get install -y curl netcat-openbsd

while ! nc -z ${SERVER_IP} 6443
do
	sleep 2
done

curl -sfL https://get.k3s.io | K3S_URL="https://${SERVER_IP}:6443" K3S_TOKEN="${NODE_TOKEN}" sh -

echo "worker connected"
