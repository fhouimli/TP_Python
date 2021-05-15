#!/bin/bash

sudo apt-get update  
sudo apt-get -y install open-iscsi
sudo apt-get -y install lvm2
#sudo apt-get -y install gnupg #gnupg2 gnupg3

#mkfs.ext4 /dev/sdb
#mkdir -p /backup1
#echo "/dev/sdb   /backup1  ext4   defaults    0   0">> /etc/fstab
#mount /backup1

##ssh authentification
#sudo sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
#sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
#sudo sed -i 's/#PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#sudo service ssh restart

#useradd userjob -d /home/userjob -s /bin/bash
#mkdir -p /home/userjob/
#chown userjob.userjob /home/userjob
#sudo echo -e "Mypass\nMypass\n" | passwd userjob
#sudo -u userjob ssh-keygen -t rsa -b 2048 -f /home/userjob/.ssh/id_rsa 
#echo "userjob  ALL=NOPASSWD: /usr/bin/apt-get" | sudo tee /etc/sudoers.d/userjob


## java for jenkins
sudo apt -y update
sudo apt -y install ca-certificates
sudo apt -y install openjdk-11-jdk
sudo apt -y install openjdk-11-jdk
#installer gnup
sudo apt -y install gnupg

## Jenkins
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
	
sudo apt-get update
sudo apt-get -y install jenkins
#
#start du service kenkins
sudo service jenkins start


ufw allow 8080/tcp
# installation pare feu  iptables
#sudo apt-get update
#sudo apt-get install -y iptables
#echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
#echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
#sudo apt-get install -y iptables-persistent

#ajout regle firewall
#sudo iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
#sudo iptables -t filter -A INPUT -p tcp --dport 8080 -j ACCEPT
#sudo iptables-save -f /etc/iptables/rules.v4

#########Installation Git#######################
sudo apt-get -y install git

sleep 30

#########Installation Gradle#######################
sudo apt-get -y remove gradle
sleep 30
sudo curl -O https://downloads.gradle-dn.com/distributions/gradle-7.0.1-bin.zip
sleep 60
sudo mkdir /var/lib/Gradle
sleep 30
sudo apt install -y unzip
sleep 30
sudo unzip -d -A /var/lib/Gradle gradle-7.0.1-bin.zip
sleep 30

#=============Installation Python ========================
sudo apt-get -y install python3-pip
sleep 10

#####################Récupération mdp Jenkins#####################"

sudo cat /var/lib/jenkins/secrets/initialAdminPassword