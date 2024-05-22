## Initial Dependencies

Install Raspberry Pi OS 64bit Lite.

Add the following to the end of the line in /boot/firmware/cmdline.txt

```
cgroup_memory=1 cgroup_enable=memory
```

Reboot

## Install k3s

For latest supported version for Rancher

```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.28.9+k3s1 sh -
```

Else for latest version

```bash
curl -sfL https://get.k3s.io | sh -
```

## Install Helm

```bash
apt install git -y
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

## Install Cert Manager

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
```

## Install Rancher

```bash
kubectl create namespace cattle-system
```

```bash
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
```

```bash
helm repo update
```

Note you'll need to change the hostname and password below. The replicas is ok at -1 as it will just spin up a rancher instance for each k3s node you have.

```bash
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=a.local.dns.name \
  --set bootstrapPassword=password \
  --set replicas=-1
```