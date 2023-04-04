#!/usr/bin/bash
echo -e "User is ROOT, attempting to install packages\n"
echo -e "################################\n"
echo -e "RUNNING SYSTEM UPDATE FOR UBUNTU 22.04...\n"
echo -e "################################\n"
sudo apt update && sudo apt upgrade -y
echo -e "\n"

sleep 1

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

sleep 1

echo -e "################################\n"
echo "INSTALLING nala...\n"
echo -e "################################\n"
sudo apt install -y nala
sudo nala fetch
sudo nala update
echo -e "\n"

sleep 1

echo -e "################################\n"
echo -e "INSTALLING DOCKER-CE..."
echo -e "################################\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo nala update
apt-cache policy docker-ce
sudo nala install -y docker-ce
sudo systemctl enable docker
docker --version
#sudo usermod -aG docker ${USER}
echo -e "\n"

sleep 1

echo -e "################################\n"
echo -e "INSTALLING DOCKER-COMPOSE 2.3.3...\n"
echo -e "################################\n"
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version
echo -e "\n"

sleep 1

echo -e "################################\n"
echo -e "INSTALLING ZSH & OH-MY-ZSH...\n"
echo -e "################################\n"
sudo nala install -y zsh
zsh --version
sudo nala install -y git-core curl fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sleep 1
su - vnc
sleep 1
# sudo usermod -aG docker ${USER}
# su - ${USER}

sudo usermod -aG docker vnc
sleep 1
su - vnc