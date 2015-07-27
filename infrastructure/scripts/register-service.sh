#!/bin/sh

echo "----> Removing service"
sudo update-rc.d -f registrolivre remove

echo "----> Creating service"
sudo mv service/service.sh /etc/init.d/registrolivre
sudo chmod +x /etc/init.d/registrolivre
sudo update-rc.d registrolivre defaults
