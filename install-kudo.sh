function install_cert_manager {
  kubectl apply -f https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml
}

function install_kubectl {
  if ! [ -x "$(command -v kubectl)" ]; then
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  fi
}

function install_kudo_cli {
  if ! [ -x /usr/local/bin/kubectl-kudo ]; then
    VERSION=0.19.0 # look up the current stable release at https://github.com/kudobuilder/kudo/releases/latest
    OS=$(uname | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m)
    wget -O kubectl-kudo https://github.com/kudobuilder/kudo/releases/download/v${VERSION}/kubectl-kudo_${VERSION}_${OS}_${ARCH}
    chmod +x kubectl-kudo
    # add to your path
    sudo mv kubectl-kudo /usr/local/bin/kubectl-kudo
  fi
}

function insecure_kudo_init_for_demo {
  kubectl kudo init --unsafe-self-signed-webhook-ca
}

install_kubectl
install_cert_manager
install_kudo_cli
insecure_kudo_init_for_demo