# node and label

kubectl config get-contexts

kubectl config set current-context vagrant-kubeadm

source <(kubectl completion bash)

kubectl get node

kubectl get node k8s-master

describe node k8s-master

kubectl get node k8s-master -o wide

kubectl get node k8s-master -o json

kubectl get node k8s-master -o yaml

kubectl get node k8s-master --show-labels

kubectl label node k8s-master env=test

kubectl get node k8s-master --show-labels

kubectl label node k8s-master env-

kubectl get node k8s-master --show-labels

kubectl label nodes k8s-worker1 node-role.kubernetes.io/worker=

kubectl label nodes k8s-worker2 node-role.kubernetes.io/worker=