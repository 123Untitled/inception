#!/bin/bash

git config --global user.email "123untitled@pm.me"
git config --global user.name "arthur"

apt-get upgrade;
apt-get update;

apt-get install apt-transport-https -y
apt-get install ca-certificates -y
apt-get install curl -y
apt-get install gnupg2 -y
apt-get install software-properties-common -y
apt-get install make -y
apt-get install neovim -y
apt-get install ssh -y
apt-get install openssh-server -y
apt-get install zsh -y
chsh -s /bin/zsh root;

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

apt-get update;
apt-get install docker-ce;
curl -L https://github.com/docker/compose/releases/download/1.25.3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

systemctl status docker;

systemctl start ssh;
systemctl status ssh;:
#hostname -I;
#whoami;
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
chsh -s /usr/bin/zsh
touch /root/.zshrc
echo 'PROMPT="[%m] %n | %~ > "' >> /root/.zshrc

xrandr -s 1440x900
