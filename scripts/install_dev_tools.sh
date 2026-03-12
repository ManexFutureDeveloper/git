#!/bin/bash
# install_dev_tools.sh - Instalación de herramientas de desarrollo
# Instala: Node.js (LTS), Python 3, pip y herramientas comunes
# Compatibilidad: Ubuntu / Debian

set -euo pipefail

echo "========================================="
echo "  Instalación de herramientas de desarrollo"
echo "========================================="

# ---- Node.js (LTS via NodeSource) ----
echo "[1/3] Instalando Node.js LTS..."
NODESOURCE_SETUP=$(mktemp)
curl -fsSL https://deb.nodesource.com/setup_lts.x -o "$NODESOURCE_SETUP"
sudo -E bash "$NODESOURCE_SETUP"
rm -f "$NODESOURCE_SETUP"
sudo apt install -y nodejs
echo "  Node.js: $(node --version)"
echo "  npm:     $(npm --version)"

# ---- Python 3 y pip ----
echo "[2/3] Instalando Python 3 y pip..."
sudo apt install -y python3 python3-pip python3-venv
echo "  Python: $(python3 --version)"
echo "  pip:    $(pip3 --version)"

# ---- Herramientas adicionales de desarrollo ----
echo "[3/3] Instalando herramientas adicionales..."
sudo apt install -y \
    jq \
    htop \
    tree \
    vim

echo ""
echo "✅ Herramientas de desarrollo instaladas correctamente."
