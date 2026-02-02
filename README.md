
# Bootstrap ESP32 Dev Environment (WSL2)

## Qué instala
- ESP-IDF
- Mongoose OS
- Mosquitto MQTT
- Node.js LTS
- VS Code Linux GUI

## Uso
```bash
chmod +x bootstrap
./bootstrap install all
./bootstrap uninstall all
./bootstrap status
```

## Qué NO toca
- Docker / Docker Desktop
- Configuración WSL
- Paquetes base críticos

## Advertencias
- Scripts no interactivos
- Reversibles
- Idempotentes
