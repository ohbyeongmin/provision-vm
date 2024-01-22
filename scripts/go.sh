#!/usr/bin/env zsh

sudo curl -LO https://go.dev/dl/go$GO_VERSION.linux-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-$ARCH.tar.gz
sudo rm -r go$GO_VERSION.linux-$ARCH.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >>$HOME/.zshrc
source ~/.zshrc

go version
