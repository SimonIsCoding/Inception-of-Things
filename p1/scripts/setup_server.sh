#!/bin/bash
apt-get update && apt-get install -y curl && apt-get install -y virtualbox-guest-utils
curl -sfL https://get.k3s.io | sh -
sleep 10
cp /var/lib/rancher/k3s/server/node-token /vagrant/node-token
echo "server ready"
