#!/bin/sh
# Assumes Debian-based

# Update and deps
apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


# Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

# Compose code-server
docker-compose -f code-server/docker-compose.yaml up --build --detach
#DEBUG sudo -H SUDO_PASSWORD=$SUDO_PASSWORD CODE_PASSWORD=$CODE_PASSWORD docker-compose -f code-server/docker-compose.yaml up --build --detach
