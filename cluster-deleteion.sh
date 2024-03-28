#!/bin/bash
 
# Uninstall Kubernetes
echo "Uninstalling Kubernetes..."
kubeadm reset -f
 
# Stop and disable kubelet service
echo "Stopping and disabling kubelet service..."
systemctl stop kubelet
systemctl disable kubelet
 
# Remove Kubernetes binaries and configurations
echo "Removing Kubernetes binaries and configurations..."
rm -rf /etc/kubernetes
rm -rf $HOME/.kube
 
# Uninstall containerd
echo "Uninstalling containerd..."
yum remove -y containerd.io
 
# Clean up any remaining Docker related files or configurations
echo "Cleaning up Docker related files and configurations..."
rm -rf /var/lib/docker
rm -rf /etc/docker
 
# Remove Docker related packages
echo "Removing Docker related packages..."
yum remove -y docker-ce docker-ce-cli containerd.io
 
# Purge any remaining configuration files
echo "Purging remaining configuration files..."
yum autoremove -y
 
echo "Kubernetes and containerd uninstallation completed successfully."