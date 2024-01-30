# Provision VM!

Provision VM for your blockchain local developement environment!

## Prerequisite

- [vagrant](https://developer.hashicorp.com/vagrant/downloads)
- vmware or virtualbox etc...

## Provisiong development tools

- zsh / oh-my-zsh
- curl, git, cmake, vim, net-tools, jq, direnv, unzip
- nodejs
- pnpm
- golang
- foundry
- awscli
- terraform
- kubectl

## How to use it

1. Install vagrant ENV Plugin

   ```bash
   $vagrant plugin install vagrant-env
   ```

2. configure your env

   ```bash
   cp .env.example .env
   ```

   and fill value

3. change ubuntu image

   Use the specific ubuntu image for your host arch. You can find them on the following [page](https://app.vagrantup.com/boxes/search)

   ```shell
   # Vagrantfile

   config.vm.box = "bento/ubuntu-22.04-arm64"
   ```

4. change host name what you want

   ```shell
   # Vagrantfile

   config.vm.hostname = "your-vm-hostname"
   config.vm.define "your-vm-hostname"
   ```

5. Start
   ```bash
   $vagrant up
   ```

## stop & destroy vm

### stop

```bash
$vagrant suspend
```

### destroy

```bash
$vagrant destroy
```

## remote access in VScode

1. input ssh-config

   ```bash
   $vagrant ssh-config >> ~/.ssh
   ```

2. select host in vscode

   - open your vscode
   - shift + command + p
   - select `Remote-SSH: Connect to Host`
   - select your vm host
