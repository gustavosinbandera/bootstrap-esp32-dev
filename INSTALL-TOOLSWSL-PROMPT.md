# 🧠 PROMPT OFICIAL AUDITADO
## Bootstrap Profesional ESP32 Dev Environment (WSL + GUI)

---

## 🎭 ROL OBLIGATORIO

Actúa como un **DevOps Engineer senior + Embedded Systems Architect**, con experiencia real en:

- ESP32 / Espressif / ESP-IDF
- Mongoose OS
- MQTT / Mosquitto
- Node.js (LTS)
- Linux profesional (Ubuntu)
- WSL2 + WSLg (Windows 11)
- Toolchains C / C++
- Sistemas reproducibles e idempotentes

Tu misión es crear un **sistema de bootstrap profesional**, **reversible**, **modular**, **seguro**, **no destructivo**, y **mantenible**.

---

## 🎯 OBJETIVO GENERAL

Crear un **instalador automatizado** para **Ubuntu WSL2** que permita:

```bash
./bootstrap install all
./bootstrap install mqtt
./bootstrap uninstall mqtt
./bootstrap uninstall esp-idf
./bootstrap uninstall all
./bootstrap status
```

Con un solo entrypoint (`bootstrap`) se debe poder:
- Instalar por módulos
- Desinstalar por módulos
- Consultar estado del sistema
- Repetir instalaciones sin romper nada

---

## ❗ RESTRICCIONES CRÍTICAS (NO VIOLAR)

- ❌ NO usar Docker para instalar herramientas
- ❌ NO romper Docker Desktop ni `docker-desktop`
- ❌ NO usar Snap ni Flatpak
- ❌ NO usar scripts interactivos
- ❌ NO asumir entorno fuera de WSL
- ❌ NO borrar paquetes base del sistema sin advertencia

- ✅ Ubuntu WSL2 (Windows 11)
- ✅ WSLg activo (GUI disponible)
- ✅ VS Code debe ser **Linux GUI real**
- ✅ Scripts idempotentes y reversibles

---

## 🧱 ESTRUCTURA OBLIGATORIA DEL PROYECTO

```
bootstrap-esp32-dev/
│
├── bootstrap
│
├── config/
│   ├── versions.env
│   ├── paths.env
│   └── registry.env
│
├── core/
│   ├── system.install.sh
│   ├── system.uninstall.sh
│
├── esp/
│   ├── esp_idf.install.sh
│   ├── esp_idf.uninstall.sh
│   ├── mongoose.install.sh
│   └── mongoose.uninstall.sh
│
├── mqtt/
│   ├── mosquitto.install.sh
│   └── mosquitto.uninstall.sh
│
├── node/
│   ├── node.install.sh
│   └── node.uninstall.sh
│
├── gui/
│   ├── vscode.install.sh
│   └── vscode.uninstall.sh
│
├── tools/
│   ├── utils.install.sh
│   └── utils.uninstall.sh
│
└── README.md
```

---

## 🔑 ENTRYPOINT `bootstrap`

Requisitos obligatorios:
- Bash (`#!/usr/bin/env bash`)
- `set -e`
- Comandos:
  - `install <module|all>`
  - `uninstall <module|all>`
  - `status`
- Carga `versions.env`, `paths.env`, `registry.env`
- Ejecuta scripts `.install.sh` / `.uninstall.sh`
- Actualiza `registry.env`
- Nunca borra algo que no instaló

---

## 🧾 REGISTRY (ESTADO DEL SISTEMA)

Archivo `config/registry.env`:

```bash
INSTALLED_ESP_IDF=0
INSTALLED_MONGOOSE=0
INSTALLED_MOSQUITTO=0
INSTALLED_NODE=0
INSTALLED_VSCODE=0
```

Debe ser actualizado automáticamente.

---

## ⚙️ versions.env

```bash
ESP_IDF_VERSION=v5.1.2
NODE_VERSION=18
VSCODE_CHANNEL=stable
```

---

## 📁 paths.env

```bash
export DEV_ROOT=$HOME/dev
export ESP_ROOT=$DEV_ROOT/esp
export TOOLS_ROOT=$DEV_ROOT/tools
```

---

## 🛠️ REGLAS DE MÓDULOS

- Todo `.install.sh` debe tener `.uninstall.sh`
- Uninstall solo elimina lo que instaló
- Nada interactivo
- Nada destructivo fuera del scope

---

## 📘 README.md

Debe explicar:
- Qué instala
- Cómo instalar
- Cómo desinstalar
- Qué NO toca (Docker, WSL)
- Advertencias

---

## 🛑 REGLA FINAL

Responde **solo** con los archivos completos, sin explicaciones externas.






wsl --list --verbose
wsl --shutdown
wsl --unregister Ubuntu
wsl --list

lsb_release -a



sudo apt update
sudo apt upgrade -y
wsl --shutdown

cd bootstrap-esp32-dev
chmod +x bootstrap
./bootstrap install all