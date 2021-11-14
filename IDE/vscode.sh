#!/bin/bash
# this feature is experimental now, it might misbehave
curl -fsSL https://code-server.dev/install.sh | sh
# sudo code-server --auth none --bind-addr 0.0.0.0:8080
sudo systemctl enable --now code-server@$USER
#allow the service to create config file
sleep 5
#update the code-server service to not user loopback and run on localhost
echo "bind-addr: 0.0.0.0:8080
auth: none
cert: false" > ~/.config/code-server/config.yaml
# restart the server with new config
sudo systemctl restart code-server@$USER

