#!/bin/bash
# setup.sh - Configuración inicial del sistema con herramientas esenciales
# Compatibilidad: Ubuntu / Debian

set -euo pipefail

echo "========================================="
echo "  Configuración inicial del sistema"
echo "========================================="

# Actualizar lista de paquetes
echo "[1/4] Actualizando lista de paquetes..."
sudo apt update

# Actualizar paquetes instalados
echo "[2/4] Actualizando paquetes instalados..."
sudo apt upgrade -y

# Instalar herramientas esenciales
echo "[3/4] Instalando herramientas esenciales..."
sudo apt install -y \
    curl \
    wget \
    unzip \
    zip \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Limpiar paquetes innecesarios
echo "[4/4] Limpiando paquetes innecesarios..."
sudo apt autoremove -y
sudo apt clean

echo ""
echo "✅ Configuración inicial completada correctamente."
