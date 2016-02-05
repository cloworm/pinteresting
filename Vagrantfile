# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'danny-rails-middleman'
  config.vm.synced_folder ".", "/home/vagrant/pinteresting", 
  owner: "vagrant",
  group: "www-data",
  mount_options: ["dmode=775,fmode=664"]

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  config.vm.provider 'virtualbox' do |v|
    v.cpus = 2
    v.memory = 2048
  end

end
