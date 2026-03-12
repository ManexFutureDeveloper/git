# Automatizaciones con Git

Colección de scripts `.sh` para automatizar instalaciones.

## Requisitos previos: Instalar Git

Antes de poder clonar este repositorio y usar los scripts, necesitas tener **Git** instalado en tu sistema.

### Instalar Git en Ubuntu / Debian

```bash
sudo apt update
sudo apt install git -y
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
| `scripts/install_docker.sh` | Instalación de Docker y Docker Compose |

---

## Estructura del repositorio

```
git/
├── README.md
└── scripts/
    ├── 
    ├── 
    └── install_docker.sh
```


