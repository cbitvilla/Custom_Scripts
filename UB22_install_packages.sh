#!/usr/bin/bash

#The $EUID environment variable holds the current user's UID. Root's UID is 0
if [ "$EUID" -ne 0 ]; then
  #echo "user is not root, do you wish to attempt to switch to root...\n"
  #sudo su -
  	echo -e "User is not root attempting to install packages as $USER\n"
  	echo -e "################################\n"
	echo -e "RUNNING SYSTEM UPDATE FOR UBUNTU 22.04...\n"
	echo -e "################################\n"
	sudo apt update && apt upgrade -y
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING NECESSARY PACKAGES...\n"
	echo -e "################################\n"

	sudo apt install -y apt-transport-https \
	libc6 \
	libstdc++6 \
	ca-certificates \
	tar \
	wget \
	build-essential \
	curl \
	file \
	git \
	software-properties-common \
	openssh-server \
	vim
	echo -e "\n"

	echo -e "################################\n"
	echo "INSTALLING nala...\n"
	echo -e "################################\n"
	sudo apt install -y nala
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING DOCKER-CE..."
	echo -e "################################\n"
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt-cache policy docker-ce
	sudo apt install -y docker-ce
	systemctl enable docker
	docker --version
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING DOCKER-COMPOSE...\n"
	echo -e "################################\n"
	mkdir -p ~/.docker/cli-plugins/
	curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
	chmod +x ~/.docker/cli-plugins/docker-compose
	docker compose version
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING ZSH & OH-MY-ZSH...\n"
	echo -e "################################\n"
	sudo apt install -y zsh
	zsh --version
	sudo apt install -y git-core curl fonts-powerline
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  
else
  echo -e "User is ROOT, attempting to install packages\n"
  echo -e "################################\n"
	echo -e "RUNNING SYSTEM UPDATE FOR UBUNTU 22.04...\n"
	echo -e "################################\n"
	apt update && apt upgrade -y
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING NECESSARY PACKAGES...\n"
	echo -e "################################\n"

	apt install -y apt-transport-https \
	libc6 \
	libstdc++6 \
	ca-certificates \
	tar \
	wget \
	build-essential \
	curl \
	file \
	git \
	software-properties-common \
	openssh-server \
	vim
	echo -e "\n"

	echo -e "################################\n"
	echo "INSTALLING nala...\n"
	echo -e "################################\n"
	apt install -y nala
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING DOCKER-CE..."
	echo -e "################################\n"
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt update
	apt-cache policy docker-ce
	apt install -y docker-ce
	systemctl enable docker
	docker --version
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING DOCKER-COMPOSE...\n"
	echo -e "################################\n"
	mkdir -p ~/.docker/cli-plugins/
	curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
	chmod +x ~/.docker/cli-plugins/docker-compose
	docker compose version
	echo -e "\n"

	echo -e "################################\n"
	echo -e "INSTALLING ZSH & OH-MY-ZSH...\n"
	echo -e "################################\n"
	apt install -y zsh
	zsh --version
	apt install -y git-core curl fonts-powerline
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
