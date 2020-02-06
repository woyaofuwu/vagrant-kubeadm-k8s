#/bin/sh

##### Installing runtime #####
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
# 選用 Docker
# Docker Engine - Community for CentOS
# https://docs.docker.com/install/linux/docker-ce/centos/

# Uninstall old versions
sudo sudo yum remove docker docker-client docker-client-latest docker-common \
                  docker-latest docker-latest-logrotate docker-logrotate docker-engine

# SET UP THE REPOSITORY
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# 跑更新
sudo yum update -y

# install some tools
# sudo yum install -y vim telnet bind-utils wget

# The centos-extras repository must be enabled. This repository is enabled by default.
sudo yum-config-manager --enable centos-extras

# Use the following command to set up the stable repository.
sudo yum-config-manager --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum clean all

# Install the latest version of Docker Engine - Community and containerd
sudo yum install -y docker-ce docker-ce-cli containerd.io

##### 修正 Cgroup drivers 問題 #####
# https://kubernetes.io/docs/setup/production-environment/container-runtimes/

## Create /etc/docker directory.
sudo mkdir /etc/docker

# Setup daemon.
sudo cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

sudo mkdir -p /etc/systemd/system/docker.service.d

# Restart Docker
sudo systemctl daemon-reload
sudo systemctl stop docker

##### 修正 Cgroup drivers 問題 #####

# Start and enable Docker.
sudo systemctl enable --now docker

##### Post-installation steps for Linux #####
# Manage Docker as a non-root user
# https://docs.docker.com/install/linux/linux-postinstall/

# Create the docker group.
# sudo groupadd docker

# Add your user to the docker group.
sudo usermod -aG docker vagrant
##### Post-installation steps for Linux #####

##### Installing runtime #####

##### Installing kubeadm, kubelet and kubectl #####
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
sudo bash -c 'cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF'

# Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable --now kubelet

sudo bash -c 'cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward=1
EOF'
sudo sysctl --system
# net.ipv4.ip_forward=1 是後來新增的設定
##### Installing kubeadm, kubelet and kubectl #####

# 清暫存
sudo yum clean all

# 因為防火牆要開的 Port 有點複雜，故乾脆選擇關閉防火牆
sudo systemctl disable --now firewalld

# 關閉 swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# 重開機
sudo systemctl reboot