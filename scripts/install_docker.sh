#!/bin/bash
# install_docker.sh - Instalación de Docker Engine y Docker Compose
# Compatibilidad: Ubuntu / Debian

set -euo pipefail

echo "========================================="
echo "  Instalación de Docker y Docker Compose"
echo "========================================="

# Detectar distribución
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO_ID="${ID:-ubuntu}"
else
    echo "No se pudo detectar la distribución. Asumiendo Ubuntu."
    DISTRO_ID="ubuntu"
fi

# Eliminar versiones antiguas si existen
echo "[1/4] Eliminando versiones antiguas de Docker (si las hay)..."
sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

# Instalar dependencias
echo "[2/4] Instalando dependencias..."
sudo apt update
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Añadir clave GPG oficial de Docker
echo "[3/4] Configurando repositorio oficial de Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL "https://download.docker.com/linux/${DISTRO_ID}/gpg" \
    -o /tmp/docker.gpg
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg /tmp/docker.gpg
rm -f /tmp/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/${DISTRO_ID} \
  $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker Engine y Docker Compose
echo "[4/4] Instalando Docker Engine y Docker Compose..."
sudo apt update
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# Añadir el usuario actual al grupo docker (para evitar usar sudo)
sudo usermod -aG docker "$USER"

echo ""
echo "  Docker:         $(sudo docker --version)"
echo "  Docker Compose: $(sudo docker compose version)"
echo ""
echo "✅ Docker instalado correctamente."
echo "⚠️  Cierra sesión y vuelve a entrar para que los cambios de grupo surtan efecto."
