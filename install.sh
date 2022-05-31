#!/bin/bash

# Simple script to install the DATASIM requirements on a fresh Ubuntu 20.04 machine
function announce() {
	echo ""
	echo "#====================================================#"
	echo "#"
	echo "#            Installing $1"
	echo "#"
	echo "#====================================================#"
}

# Curl
#
announce "Curl"

if ! [ -x "$(command -v curl)" ]; then
	
	# Curl is easy
	apt-get install curl -y
	
else
	echo "Skipping, Curl already installed!"
fi

# Docker
#
announce "Docker"

if ! [ -x "$(command -v docker)" ]; then
	
	# Docker is a bit complicated
	#
	# Add the GPG Key
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
	# Add the Docker repository to our APT sources
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	
	# With those added, update our packages
	apt-get update

	# Since we're up to date, get docker
	apt-get install -y docker-ce
else
	echo "Skipping, docker already installed!"
fi


# Docker-Compose
#
announce "Docker-Compose"

if ! [ -x "$(command -v docker-compose)" ]; then
	
	# Docker-Compose is also complicated
	#
	# Add the GPG Key
	curl -L https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	
	# Make sure it's executable
	chmod +x /usr/local/bin/docker-compose

else
	echo "Skipping, docker-compose already installed!"
fi


# Java
#
announce "openjdk"

if ! [ -x "$(command -v java)" ]; then

	#Jdk should be easy
	apt install openjdk-8-jdk -y
else
	echo "Skipping, openjdk already installed!"
fi

#bash
#
announce "bash"
if ! [ -x "$(command -v bash)" ]; then
	apt install bash
else
	echo "Skipping, bash already installed!"
fi

#rlwrap
#
announce "rlwrap"
if ! [ -x "$(command -v rlwrap)" ]; then
	apt install rlwrap
else
	echo "Skipping, rlwrap already installed!"
fi

#Leiningen
#
announce "Leiningen"
if ! [ -x "$(command -v lein)" ]; then

	#Download lein script
	curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > lein
	
	#Move the script to the user programs directory
	sudo mv lein /usr/local/bin/lein
	
	#Add execute permissions
	sudo chmod a+x /usr/local/bin/lein
else
	echo "Skipping, Leiningen already installed!"
fi

#Clojure
#
announce "Clojure"
if ! [ -x "$(command -v clojure)" ]; then

	#Download install script
	curl -O https://download.clojure.org/install/linux-install-1.10.2.774.sh
	
	#Add execute permissions
	chmod +x linux-install-1.10.2.774.sh
	
	#Run
	./linux-install-1.10.2.774.sh

else
	echo "Skipping, Closure already installed!"
fi

#NodeJS
#
announce "NodeJS"
if ! [ -x "$(command -v node)" ]; then
	#get the version 12 of node
	curl -sL https://deb.nodesource.com/setup_12.x | bash -
	
	#install
	apt install nodejs

else
	echo "Skipping, NodeJS already installed!"
fi


echo ""
echo "DATASIM requirements should all be ready."
echo ""
