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
                    machine.vm.network :public_network, ip: "192.168.0.50"
                    machine.vm.provider 'virtualbox' do |vb|
						vb.memory = '3000'
					machine.vm.network :forwarded_port, guest: 8080, host: 8080, host_ip: "192.168.0.50"
						# UNCOMMENT FOR MORE DISKS
						#disk2_vdi = 'disk2.vdi'
						# Creer les fichiers au bon format pour VBox s'ils n'existent pas
						#unless File.exist?(disk2_vdi)
						#vb.customize ['createhd', '--filename', disk2_vdi, '--size', 20 * 1024]
                        #end
        
				    # On attache les fichiers 'disque' sur la VM
				    #vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller','--port', 1, '--device', 0, '--type', 'hdd', '--medium',disk2_vdi]
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
				srvnexus.vm.network :public_network, ip: "192.168.0.51"
				srvnexus.vm.provider :virtualbox do |v|
					v.memory = '1000'
				srvnexus.vm.network :forwarded_port, guest: 8081, host: 8081, host_ip: "192.168.0.51"
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
	
#-------------- Serveur Dev1
# Vagrant.configure('2') do |config|
#
#   config.vm.box_check_update = false
#	config.vm.define "srvdev1" do |srvdev|
#		srvdev.vm.box = "debian/buster64"
#		srvdev.vm.hostname = "srvdev1"
#		srvdev.vm.box_url = "debian/buster64"
#		srvdev.vm.network :public_network, ip: "192.168.0.31"
#		srvdev.vm.provider :virtualbox do |v|
#		   v.memory = '512'
#		end
#		
#		srvdev.vm.provision "shell", inline: <<-SHELL
#		  echo "192.168.0.30 srvjenkins" >> /etc/hosts
#		SHELL
#	    srvdev.vm.provision 'shell', path: 'provisiondev.sh'
#	end
#	
#end
	
	
#-------------- Serveur Dev2

#Vagrant.configure('2') do |config|
#
#    config.vm.box_check_update = false
#	
#	config.vm.define "srvdev2" do |srvdev|
#		srvdev.vm.box = "debian/buster64"
#		srvdev.vm.hostname = "srvdev2"
#		srvdev.vm.box_url = "debian/buster64"
#		srvdev.vm.network :public_network, ip: "192.168.0.32"
#		srvdev.vm.provider :virtualbox do |v|
#			v.memory = '512'
#		end
#    srvdev.vm.provision "shell", inline: <<-SHELL
#      echo "192.168.0.30 srvjenkins" >> /etc/hosts
#    SHELL
#    srvdev.vm.provision 'shell', path: 'provisiondev.sh'
#	end
#  
#  
#end