tkg create cluster adess-tkg01 --plan=dev --vsphere-controlplane-endpoint 192.168.190.11

# Deploy Metallb as LoadBalancer
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Deploy Contour
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml