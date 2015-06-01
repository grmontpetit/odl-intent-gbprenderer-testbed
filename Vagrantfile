# -*- mode: ruby -*-
# # vi: set ft=ruby :
 
# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
 
# Require YAML module
require 'yaml'
 
# Read YAML file with box details
servers = YAML.load_file('env.yaml')
 
# Scripts def
$init = <<SCRIPT
  aptitude update
  aptitude install -y build-essential fakeroot debhelper autoconf automake libssl-dev graphviz \
  python-all python-qt4 python-twisted-conch libtool git tmux vim python-pip python-paramiko \
  python-sphinx
  pip install alabaster
SCRIPT

$ovs = <<SCRIPT
  wget http://openvswitch.org/releases/openvswitch-2.3.0.tar.gz
  tar xf openvswitch-2.3.0.tar.gz
  pushd openvswitch-2.3.0
  DEB_BUILD_OPTIONS='parallel=8 nocheck' fakeroot debian/rules binary
  popd
  sudo dpkg -i openvswitch-common*.deb openvswitch-datapath-dkms*.deb python-openvswitch*.deb openvswitch-pki*.deb openvswitch-switch*.deb
  rm -rf *openvswitch*
SCRIPT

$mininet = <<SCRIPT
  git clone git://github.com/mininet/mininet
  pushd mininet
  git checkout -b 2.1.0p1 2.1.0p1
  patch -p0 < /vagrant/mn-options.patch
  ./util/install.sh -fn
  popd
SCRIPT

$ryu = <<SCRIPT
  aptitude install -y python-lxml python-pbr python-greenlet
  pip install six==1.7.0 networkx ryu
SCRIPT

$trema = <<SCRIPT
  sudo aptitude install -y gcc make libpcap-dev libssl-dev ruby2.0 ruby2.0-dev
  sudo gem install bundler
  git clone git://github.com/trema/trema-edge trema
  pushd trema
  bundle install
  rake
  popd
SCRIPT

$cleanup = <<SCRIPT
  aptitude clean
  rm -rf /tmp/*
SCRIPT

$gbp = <<SCRIPT
  export GBPHOST1="config.vm.box = envconfig[‘gbphost1’]"
  export GBPHOST2="config.vm.box = envconfig[‘gbphost2’]"
  export CONTROLLER="config.vm.box = envconfig[‘controller’]"
  sudo apt-get install -y python-ipaddr
SCRIPT

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.vm.network "public_network", ip: servers["local_ip"]
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
      end
      # Make ovs image here
      # set image env vars here
      controller = servers["controller"]
      remote_ip = servers["remote_ip"]
      remote_alias = servers["remote_alias"]
      hhh = 'export REMOTE_IP="' + remote_ip + '"'
      srv.vm.provision "shell", privileged: false, inline: hhh
      #srv.vm.provision "shell", privileged: false, inline: 'export CONTROLLER="' + controller + '"'
      #srv.vm.provision "shell", privileged: false, inline: 'export REMOTE_ALIAS="' + remote_alias + '"'
      srv.vm.provision "shell", privileged: false, inline: 'echo "export REMOTE_IP=\"' + remote_ip + '\""'
      srv.vm.provision "shell", privileged: false, inline: 'echo $REMOTE_IP'
      #srv.vm.provision "shell", privileged: false, inline: 'echo $CONTROLLER'
      #srv.vm.provision "shell", privileged: false, inline: 'echo $REMOTE_ALIAS'
    end
  end
end