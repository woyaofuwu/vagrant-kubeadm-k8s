# Pod

Pod Definition

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-busybox
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
  - name: busybox
    image: busybox
    command: ["/bin/sh"]
    args: ["-c", "while true; do echo hello; sleep 10;done"]

```

kubectl create -f nginx_busybox.yml

kubectl get pods

kubectl describe pod nginx-busybox

kubectl get pods nginx-busybox -o wide

kubectl exec nginx-busybox -it sh

kubectl delete -f nginx_busybox.yml

