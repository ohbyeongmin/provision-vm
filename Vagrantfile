Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04-arm64"
  config.vm.hostname = "provision-vm"
  config.vm.define "provision-vm"
  config.env.enable

  config.vm.network "private_network", type: "dhcp"

  config.vm.synced_folder "./project", "/home/vagrant/project"

  config.vm.provider "vmware_desktop" do |vmware|
    vmware.gui    = false
    vmware.cpus   = 4
    vmware.memory = "4096"
  end

  config.vm.provision "shell" do |common|
    common.env = {
      DEBIAN_FRONTEND:"noninteractive",
      GIT_USER_NAME: ENV['GIT_USER_NAME'],
      GIT_USER_EMAIL: ENV['GIT_USER_EMAIL']
    }
    common.inline = <<-SHELL
      sudo apt-get update
      sudo apt-get install -y curl git cmake vim net-tools jq direnv unzip zsh
      sudo chsh -s /bin/zsh vagrant
      curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
      sudo cp /root/.zshrc /home/vagrant/.zshrc
      sudo chown vagrant:vagrant /home/vagrant/.zshrc
      sudo cp -R /root/.oh-my-zsh /home/vagrant
      sudo chown vagrant:vagrant /home/vagrant/.oh-my-zsh
      sudo sed -i 's/robbyrussell/ys/g' /home/vagrant/.zshrc
      echo "git config --global user.name $GIT_USER_NAME" >>/home/vagrant/.zshrc
      echo "git config --global user.email $GIT_USER_EMAIL" >>/home/vagrant/.zshrc
    SHELL
  end

  config.vm.provision "shell" do |nodejs|
    nodejs.name = "install nodejs"
    nodejs.env  = {
      DEBIAN_FRONTEND:"noninteractive",
      NODE_MAJOR:ENV['NODE_VERSION']
    }
    nodejs.path = "./scripts/nodejs.sh"
  end

  config.vm.provision "shell" do |pnpm|
    pnpm.name = "install pnpm"
    pnpm.env = {
      DEBIAN_FRONTEND:"noninteractive",
    }
    pnpm.inline = "npm install -g pnpm"
  end

  config.vm.provision "shell" do |go|
    go.name = "install golang"
    go.env = {
      DEBIAN_FRONTEND:"noninteractive",
      GO_VERSION:ENV['GO_VERSION'],
      ARCH:ENV['ARCH'],
      SHELL:ENV['SHELL']
    }
    go.privileged = false
    go.path = "./scripts/go.sh"
  end

  config.vm.provision "shell" do |foundry|
    foundry.name = "install foundry"
    foundry.env = {
      DEBIAN_FRONTEND:"noninteractive",
      SHELL:ENV['SHELL']
    }
    foundry.privileged = false
    foundry.path = "./scripts/foundry.sh"
  end

  config.vm.provision "shell" do |awscli|
    awscli.name = "install awscli"
    awscli.env = {
      DEBIAN_FRONTEND:"noninteractive",
      SHELL:ENV['SHELL'],
      AWS_ACCESS_KEY:ENV['AWS_ACCESS_KEY'],
      AWS_SECRET_KEY:ENV['AWS_SECRET_KEY']
    }
    awscli.privileged = false
    awscli.path = "./scripts/awscli.sh"
  end

  config.vm.provision "shell" do |terraform|
    terraform.name = "install terraform"
    terraform.env = {
      DEBIAN_FRONTEND:"noninteractive",
      SHELL:ENV['SHELL'],
    }
    terraform.privileged = false
    terraform.path = "./scripts/terraform.sh"
  end

  config.vm.provision "shell" do |kubectl|
    kubectl.name = "install kubectl"
    kubectl.env = {
      DEBIAN_FRONTEND:"noninteractive",
      SHELL:ENV['SHELL'],
      KUBE_VERSION:ENV['KUBE_VERSION'],
      KUBE_AWS_REGION:ENV['KUBE_AWS_REGION'],
      KUBE_AWS_EKS_NAME:ENV['KUBE_AWS_EKS_NAME'],
      ARCH:ENV['ARCH']
    }
    kubectl.privileged = false
    kubectl.path = "./scripts/kubectl.sh"
  end
end
