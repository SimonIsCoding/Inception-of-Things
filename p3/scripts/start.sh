#!/bin/bash

### A lancer avec sudo

# Crée le cluster nommé iot
k3d cluster create iot

# Crée les namespaces argocd et dev
kubectl create namespace argocd
kubectl create namespace dev

# Installe Argo CD dans le namespace argocd du cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Attend le déploiement d'argo CD
kubectl wait deployment \
  --all \
  --namespace argocd \
  --for condition=Available=True \
  --timeout=300s

# Affiche le mot de passe du compte admin pour accéder a l'interface graphique d'Argo CD par la suite (A SAUVEGARDER QUELQUE PART)
# kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d # NAFFICHE RIEN A UTILISER A LA FIN

# Configure argo CD (indique le repo source et le cluster/namespace destination)
kubectl apply -f ../confs/application.yaml -n argocd

# Déploiement terminé                                   
echo "---------------------------"
echo "login : admin"
echo "password : " $(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d)
echo "---------------------------"
echo "- Pour accéder a l'interface Argo CD :"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo "puis accès avec navigateur à localhost:8080"
echo "- Pour accéder accéder au service de wil (programme) :"
echo "kubectl port-forward svc/wil-playground 8888:8888 -n dev"
echo "puis accès via shell avec curl http://localhost:8888/"