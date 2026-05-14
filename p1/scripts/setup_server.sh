#!/bin/bash
curl -sfL https://get.k3s.io | sh -
sleep 10
cp /var/lib/rancher/k3s/server/node-token /vagrant/node-token
echo "server ready"
