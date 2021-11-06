#-*- mode: ruby -*-
# vi: set ft=ruby :

# Load up our vagrant config files -- config.yaml first
_config = YAML.load(File.open(File.join(File.dirname(__FILE__),"config/config.yaml"), File::RDONLY).read)

# Local-specific/not-git-managed config -- config_local.yaml
begin
    _config.merge!(YAML.load(File.open(File.join(File.dirname(__FILE__),"config/config_local.yaml"), File::RDONLY).read))
rescue Errno::ENOENT # No config_local.yaml found -- that's OK; just
                     # use the defaults.
end

# Load sensetive variables in env
unless Vagrant.has_plugin?("vagrant-env")
  puts 'Installing vagrant-env Plugin...'
  system('vagrant plugin install vagrant-env')
end

CONF = _config

Vagrant.configure("2") do |config|
  config.vagrant.plugins = "vagrant-env"
  config.env.enable
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box =  CONF['vagrant_box']
  # set the hostname
  if CONF.has_key?("guest_name")
    config.vm.hostname = CONF['guest_name']
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = CONF['memory']
    v.cpus = CONF['cpus']
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  if CONF.has_key?("port_forward")
    CONF['port_forward'].each do |ports|
        config.vm.network :forwarded_port, guest: ports['guest'], host: ports['host']
    end
  end


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  if CONF.has_key?("sync_folder")
    CONF['sync_folder'].each do |folders|
      config.vm.synced_folder folders['host'], folders['guest']
    end
  end

  # Disable default sync folder
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  # Run os update
  config.vm.provision "shell", privileged: false, path: "lifecycle/startup.sh"

  # Install git
  config.vm.provision "shell", privileged: false, path: "git/github.sh"

  # Clone git repos
  if CONF.has_key?("git_repo")
    CONF['git_repo'].each do |repo|
        config.vm.provision "shell", env: {"token" => ENV['token']}, inline: <<-SHELL
        cd workspace 
        repo=#{repo}
        comm=$(echo $repo | awk '{split($0,a,"https://"); print a[2]}')
        printf -v url "https://%s@%s" $token $comm
        echo $url
        git clone $url
      SHELL
    end
  end
    
  # Install a better shell
  # Replace the script with shell of your choice from /shells folder
  if CONF.has_key?("shell")
    config.vm.provision "shell", privileged: false, path: "shells/fish.sh"
  end
  
  # Install golang and setup its environment
  if CONF.has_key?("lang")
    config.vm.provision "shell", privileged: false, path: "platforms/go/go.sh"
  end

  #Install container
  config.vm.provision "shell", privileged: false, path: "containers/nerdctl.sh"

  # #Install container dashboard
  # config.vm.provision "shell", privileged: false, path: "containers/dashboard.sh"

end