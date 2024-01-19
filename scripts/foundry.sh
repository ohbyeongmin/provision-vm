#!/bin/zsh

curl -L https://foundry.paradigm.xyz | zsh

echo "export PATH=$PATH:/home/vagrant/.foundry/bin" >>$HOME/.zshrc
source ~/.zshrc

foundryup
