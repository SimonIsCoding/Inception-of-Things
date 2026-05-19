#!/bin/bash
set -e

install_docker()
{
	curl -fsSL https://get.docker.com | sh
	sudo usermod -aG docker $USER
}

install_kubectl()
{
	KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
	curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
	chmod +x kubectl
	sudo mv kubectl /usr/local/bin/
}

install_k3d()
{
	curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
}

if ! command -v docker &> /dev/null
then
	install_docker
fi

if ! command -v kubectl &> /dev/null
then
	install_kubectl
fi

if ! command -v k3d &> /dev/null
then
	install_k3d
fi
