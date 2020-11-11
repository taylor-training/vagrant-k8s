
kubectl cluster-info

echo "Calico Network Plugin"
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

kubectl get pods --all-namespaces

helm repo add stable https://charts.helm.sh/stable
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo add jenkins https://charts.jenkins.io
helm repo add traefik https://helm.traefik.io/traefik
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
