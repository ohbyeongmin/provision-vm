#!/usr/bin/env zsh

curl -L https://foundry.paradigm.xyz | zsh

source ~/.zsrhc

echo "export PATH=$PATH:/home/vagrant/.foundry/bin" >>$HOME/.zshrc
source ~/.zshrc

foundryup
