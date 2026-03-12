# Automatizaciones con Git

Colección de scripts `.sh` para automatizar y optimizar instalaciones de software y configuraciones del sistema.

## Requisitos previos: Instalar Git

Antes de poder clonar este repositorio y usar los scripts, necesitas tener **Git** instalado en tu sistema.

### Instalar Git en Ubuntu / Debian

```bash
sudo apt update
sudo apt install git -y
```

### Instalar Git en Fedora / RHEL / CentOS

```bash
sudo dnf install git -y
```

### Instalar Git en macOS

```bash
# Usando Homebrew
brew install git
```

O instala las herramientas de línea de comandos de Xcode (que incluyen Git):

```bash
xcode-select --install
```

### Verificar la instalación

```bash
git --version
```

---

## Cómo usar este repositorio

### 1. Clonar el repositorio

```bash
git clone https://github.com/ManexFutureDeveloper/git.git
cd git
```

### 2. Dar permisos de ejecución a los scripts

```bash
chmod +x scripts/*.sh
```

### 3. Ejecutar un script

```bash
./scripts/<nombre-del-script>.sh
```

---

## Scripts disponibles

| Script | Descripción |
|--------|-------------|
| `scripts/setup.sh` | Configuración inicial del sistema (herramientas esenciales) |
| `scripts/install_dev_tools.sh` | Instalación de herramientas de desarrollo (Node.js, Python, etc.) |
| `scripts/install_docker.sh` | Instalación de Docker y Docker Compose |

---

## Estructura del repositorio

```
git/
├── README.md
└── scripts/
    ├── setup.sh
    ├── install_dev_tools.sh
    └── install_docker.sh
```

---

## Contribuir

Si quieres añadir tus propios scripts de automatización:

1. Haz un fork del repositorio
2. Crea una rama nueva: `git checkout -b mi-script`
3. Añade tu script en la carpeta `scripts/`
4. Haz un pull request

---

## Licencia

Este proyecto es de uso libre. Siéntete libre de adaptar los scripts a tus necesidades.
