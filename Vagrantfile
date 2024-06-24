Vagrant.configure("2") do |config|

  # flavour
  config.vm.box = "generic/ubuntu2204"

  # Brains
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2000
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
    vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--usb", "off"]
    vb.customize ["modifyvm", :id, "--uart1", "off"]
    vb.customize ["modifyvm", :id, "--uart2", "off"]
    vb.customize ["modifyvm", :id, "--uart3", "off"]
    vb.customize ["modifyvm", :id, "--uart4", "off"]
  end

  # Folder
  config.vm.synced_folder "C:/Code/laravel/ocsi/ocsi_test_frontend", "/var/www/html/ocsi_test_frontend"
  config.vm.synced_folder "C:/Code/laravel/ocsi/ocsi_test_backend", "/var/www/html/ocsi_test_backend"

  # network stuff
  config.vm.network "forwarded_port", guest: 5900, host: 5900, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 5432, host: 5432, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"

  # goodies
  config.vm.provision "shell", path: "install.sh"

end
