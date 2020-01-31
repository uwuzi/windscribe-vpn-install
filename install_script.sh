#!/bin/bash

# Wget windscribe debian package
mkdir windscribe-cli
cd windscribe-cli
wget https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_1.4-51_amd64.deb #link to latest release

# Unpack deb package
ar vx *.deb
tar -xvf data.tar.xz

# Send shit where it needs to go
sudo mv etc/bash_completion.d/windscribe_complete /etc/bash_completion.d/
sudo mv etc/init.d/windscribe-cli /etc/init.d/
sudo mv usr/bin/windscribe /usr/bin/windscribe
sudo mv usr/share/doc/windscribe-cli /usr/share/doc/

# Start and enable service
sudo rc-update add windscribe-cli default # OpenRC
sudo /etc/init.d/windscribe-cli start

# Clean up
cd ..
rm -r windscribe-cli
windscribe
