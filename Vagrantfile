VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 8153, host: 8153

  config.vm.provider "virtualbox" do |box|
	   box.name = "go-ci"
     box.memory = 2048
  end

  config.vm.provision "shell", path: "infrastructure/scripts/openjdk-8.sh"
  config.vm.provision "shell", path: "infrastructure/scripts/gradle.sh"
  config.vm.provision "shell", path: "infrastructure/scripts/nodejs.sh"
  config.vm.provision "shell", path: "infrastructure/scripts/go-server.sh"
  config.vm.provision "shell", path: "infrastructure/scripts/go-agent.sh"
  config.vm.provision "shell", path: "infrastructure/scripts/git.sh"
#rteteteteteteteauhduahduhasudh
end
