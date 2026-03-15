#!/bin/bash
set -e

echo "=== Actualizando sistema ==="
apt update && apt upgrade -y

echo "=== Instalando dependencias ==="
apt install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  apt-transport-https \
  software-properties-common

echo "=== Docker GPG key ==="
install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg | \
  gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

echo "=== Añadiendo repositorio Docker ==="
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "=== Instalando Docker ==="
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "=== Activando el inicio automático ==="
systemctl enable docker
systemctl start docker

echo "=== Comprobando que Docker funciona ==="
docker --version
docker compose version
