Vagrant.require_version ">= 1.6.0"

boxes = [
    {
        :name => "k8s-master",
        :eth1 => "192.168.50.120",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "k8s-worker1",
        :eth1 => "192.168.50.121",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "k8s-worker2",
        :eth1 => "192.168.50.122",
        :mem => "2048",
        :cpu => "2"
    }

]

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end
      config.vm.network :private_network, ip: opts[:eth1]
    end
	config.vm.provision "shell", privileged: true, path: "./setup.sh"
  end
end
