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

## Docker Compose

La carpeta `docker-compose/` contiene configuraciones listas para usar con `docker compose`.

### Cómo usar

```bash
cd docker-compose/<nombre-del-stack>
docker compose up -d
```

### Stacks disponibles

| Stack | Descripción | Puertos |
|-------|-------------|---------|
| `grafana-prometheus/` | Monitorización con Grafana y Prometheus | Grafana: 3000, Prometheus: 9090 |

#### grafana-prometheus

Levanta una pila de monitorización con:
- **Prometheus** — recolección de métricas (`http://localhost:9090`)
- **Grafana** — visualización de métricas (`http://localhost:3000`)

```bash
cd docker-compose/grafana-prometheus
# (Opcional) Personaliza las credenciales de Grafana
cp .env.example .env
# Edita .env con tus credenciales antes de continuar
docker compose up -d
```

> Las credenciales de Grafana se leen del fichero `.env` (ver `.env.example`). Si no se define `.env`, se usan los valores por defecto `admin/admin`.

---

## Estructura del repositorio

```
git/
├── README.md
├── scripts/
│   └── install_docker.sh
└── docker-compose/
    └── grafana-prometheus/
        ├── .env.example
        ├── docker-compose.yml
        └── prometheus/
            └── prometheus.yml
```
