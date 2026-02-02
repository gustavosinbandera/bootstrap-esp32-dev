
#!/usr/bin/env bash
set -e
sudo apt-get update
sudo apt-get install -y build-essential git curl wget ca-certificates gnupg
sudo apt-get install -y libusb-1.0-0 python3.12-venv


# --------------------------------------------------
# Enable ~/.bashrc.d loader (required for bootstrap)
# --------------------------------------------------

mkdir -p "$HOME/.bashrc.d"

if ! grep -q "bashrc.d" "$HOME/.bashrc"; then
  cat >> "$HOME/.bashrc" <<'EOF'

# Load custom environment fragments
if [ -d "$HOME/.bashrc.d" ]; then
  for f in "$HOME/.bashrc.d"/*.sh; do
    [ -r "$f" ] && source "$f"
  done
fi
EOF
fi