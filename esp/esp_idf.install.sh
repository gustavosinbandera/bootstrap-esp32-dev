#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$BASE_DIR/config/versions.env"
source "$BASE_DIR/config/paths.env"

mkdir -p "$ESP_ROOT"
cd "$ESP_ROOT"

if [ ! -d esp-idf ]; then
  git clone --recursive -b "$ESP_IDF_VERSION" https://github.com/espressif/esp-idf.git
fi

cd "$ESP_ROOT/esp-idf"
# Install ESP-IDF tools (toolchains, openocd, etc.)
if ! python3 tools/idf_tools.py list | grep -q xtensa-esp32-elf; then
  python3 tools/idf_tools.py install
fi

# Install ESP-IDF Python virtual environment
if [ ! -d "$HOME/.espressif/python_env" ]; then
  python3 tools/idf_tools.py install-python-env
fi