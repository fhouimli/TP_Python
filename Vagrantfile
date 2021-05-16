# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 st=2 et :
Vagrant.configure('2') do |config|

#------------------ Serveur Jenkins  
    # config.vm.box = "puppetlabs/debian-7.8-64-puppet"
    config.vm.box_check_update = false
        #config.vm.network "public_network", ip: "192.168.0.20"
                # Mettre en place un cache pour APT
                # config.vm.synced_folder 'v-cache', '/var/cache/apt'
                config.vm.define 'srvjenkins' do |machine|
				    machine.vm.box = 'debian/buster64'
                    machine.vm.hostname = 'srvjenkins'
                    machine.vm.network :public_network, ip: "192.168.0.60"
                    machine.vm.provider 'virtualbox' do |vb|
						vb.memory = '3000'
					machine.vm.network :forwarded_port, guest: 8083, host: 8083, host_ip: "192.168.0.60"
						
        
				    # On attache les fichiers 'disque' sur la VM
				    
				    end
					
	            config.vm.provision 'shell', path: 'provision_jenkins.sh'
                #config.vm.provision "shell", inline: <<-SHELL
                #  sudo cat /var/jenkins_home/secrets/initialAdminPassword
                #SHELL
                end
end
 
#----------------------Serveur Nexus---------
#VAGRANTFILE_API_VERSION = "2"

#Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	Vagrant.configure('2') do |config|
		config.vm.box_check_update = false
			config.vm.define "srvnexus" do |srvnexus|
				srvnexus.vm.box = "bento/ubuntu-20.10"
				srvnexus.vm.hostname = "srvnexus"
				srvnexus.vm.box_url = "bento/ubuntu-20.10"
				srvnexus.vm.network :public_network, ip: "192.168.0.61"
				srvnexus.vm.provider :virtualbox do |v|
					v.memory = '1000'
				srvnexus.vm.network :forwarded_port, guest: 8082, host: 8082, host_ip: "192.168.0.61"
					# Shared folder
				srvnexus.vm.synced_folder "project/", "/home/project", create: true
				end
				# Provision
					srvnexus.vm.provision 'shell', path: 'install.sh'
				
			end
		
	
		# Pour accéder à la VM depuis l'hote
		#config.vm.network :forwarded_port, guest: 8081, host: 8081, host_ip: "192.168.0.51"
		
	
		#config.vm.network :public_network, host_ip: "192.168.0.51"
	
	
		#config.vm.network "public_network", ip: "192.168.0.44"
	
		# Shared folder
		#config.vm.synced_folder "project/", "/home/project", create: true
	
	end
#end
	
