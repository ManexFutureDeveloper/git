#!/bin/bash
# install_docker.sh - Instalación de Docker Engine y Docker Compose
# Compatibilidad: Ubuntu / Debian

#!/bin/bash

set -e

echo "=== Actualizando sistema ==="
sudo apt update && sudo apt upgrade -y

echo "=== Instalando dependencias ==="
sudo apt install -y 
ca-certificates 
curl 
gnupg 
lsb-release 
apt-transport-https 
software-properties-common

echo "=== Docker GPG key ==="
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | 
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "===  Añadiendo repositorio docker ==="
echo 
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] 
https://download.docker.com/linux/ubuntu 
$(lsb_release -cs) stable" | 
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "=== Instalando Docker ==="
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "=== Activando el inicio automatico ==="
sudo systemctl enable docker
sudo systemctl start docker

echo "=== Comprobando que Docker funciona ==="
docker --version
docker compose version


