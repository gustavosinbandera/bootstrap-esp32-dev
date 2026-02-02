#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$BASE_DIR/config/paths.env"

MOS_BIN="$HOME/bin/mos"

# Ensure ~/bin exists
mkdir -p "$HOME/bin"

# Install mos as standalone binary (no APT, no PPA)
if [ ! -f "$MOS_BIN" ]; then
  curl -L https://mongoose-os.com/downloads/mos/linux/mos \
    -o "$MOS_BIN"
  chmod +x "$MOS_BIN"
fi

# Ensure ~/bin is in PATH persistently
mkdir -p "$HOME/.bashrc.d"

BIN_LOADER="$HOME/.bashrc.d/bin.sh"

if [ ! -f "$BIN_LOADER" ]; then
  cat > "$BIN_LOADER" <<'EOF'
export PATH="$HOME/bin:$PATH"
EOF
fi
