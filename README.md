# 使用 kubeadm 建立三個節點的 Kubernetes 叢集

## 目的

使用 Vagrant 來簡化節點所在虛擬機器的前置作業。

## 說明

- 	節點為 1 個 Master 與 2 個 Worker，VM 規格 2 GB RAM 與 2 CPU。

- 	名稱與 IP 規劃：

	-	master : 192.168.205.120
	
	-	worker1 : 192.168.205.121
	
	-	worker2 : 192.168.205.122

- 	作業系統以 CentOS 7 為範本。

-   工具使用 Vagrant、kubeadm，container runtime 使用 Docker。

-   參考：

    -   課程 [Kubernetes技术入门与实战](Kubernetes技术入门与实战)

        -   GitHub udemy-course / Kubernetes-CN

            -   [Setup Three Nodes K8s Cluster with Kubeadm](https://github.com/udemy-course/Kubernetes-CN/tree/master/section2/kubeadm)

    -   課程 [Kubernetes for the Absolute Beginners - Hands-on](https://www.udemy.com/course/learn-kubernetes/)

    -   Kubernetes 與 Docker 官網的 Documentation

        -	[Installing kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
		
		-	[Get Docker Engine - Community for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
		
		-	[Container runtimes](https://kubernetes.io/docs/setup/production-environment/container-runtimes/)
		
		-	[Creating a single control-plane cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)

    -   Youtube Channel [Just me and Opensource](http://www.youtube.com/c/wenkatn-justmeandopensource)

        -   GitHub justmeandopensource / kubernetes

            -	[Install Kubernetes Cluster using kubeadm](https://github.com/justmeandopensource/kubernetes/blob/master/docs/install-cluster.md)

            -	[vagrant-provisioning](https://github.com/justmeandopensource/kubernetes/tree/master/vagrant-provisioning)