#!/usr/bin/bash
# Will need to add a way to detwemin if you are root or not
# If you are NOT root, then change into root
echo -e "RUNNING SYSTEM UPDATE FOR UBUNTU 22.04...\n"
apt update && apt upgrade -y
echo -e "\n"

echo -e "INSTALLING NECESSARY PACKAGES...\n"
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

echo "INSTALLING nala...\n"
apt install -y nala
echo -e "\n"

echo -e "INSTALLING DOCKER-CE..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt-cache policy docker-ce
apt install -y docker-ce
systemctl enable docker
docker --version
echo -e "\n"

echo -e "INSTALLING DOCKER-COMPOSE...\n"
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version
echo -e "\n"

echo -e "INSTALLING ZSH & OH-MY-ZSH...\n"
apt install -y zsh
zsh --version
apt install -y git-core curl fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
