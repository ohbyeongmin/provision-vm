#!/usr/bin/env zsh

curl -LO https://dl.k8s.io/release/v$KUBE_VERSION/bin/linux/$ARCH/kubectl

curl -LO "https://dl.k8s.io/release/v$KUBE_VERSION/bin/linux/$ARCH/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

rm -rf ./kubectl*

if [ $KUBE_AWS_EKS_NAME ]; then
  export AWS_PROFILE=dev
  aws eks update-kubeconfig --region $KUBE_AWS_REGION --name $KUBE_AWS_EKS_NAME
fi
