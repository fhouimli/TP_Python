#!/bin/bash

sudo apt-get update  
sudo apt-get -y install open-iscsi
sudo apt-get -y install lvm2


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