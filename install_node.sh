#!/bin/bash

NODE_VERSION=0.10.33
NODE_ARCH=x64

# check we need to do this or not
# sudo apt-get -y install build-essential libssl-dev git curl

NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}

cd /tmp
wget http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz
tar xvzf ${NODE_DIST}.tar.gz
sudo rm -rf /opt/nodejs
sudo mv ${NODE_DIST} /opt/nodejs

sudo ln -sf /opt/nodejs/bin/node /usr/bin/node
sudo ln -sf /opt/nodejs/bin/npm /usr/bin/npm