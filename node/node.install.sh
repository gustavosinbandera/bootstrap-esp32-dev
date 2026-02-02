
#!/usr/bin/env bash
set -e
curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
sudo apt-get install -y nodejs
