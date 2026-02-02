
#!/usr/bin/env bash
set -e
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/ms.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt-get update
sudo apt-get install -y code
