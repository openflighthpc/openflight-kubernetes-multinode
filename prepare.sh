# Docker Repo
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

# Docker Packages
dnf install -y docker-ce containerd

# Kubenetes Repo
cat << EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

# Kubernetes Packages
dnf install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

# Kubernetes Images
## Should we be collecting images now? Rely on appropriate remote repo being accessible or user having their own internal one?
containerd config default > /etc/containerd/config.toml
systemctl start containerd
kubeadm config images pull
systemctl stop containerd
