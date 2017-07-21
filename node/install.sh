#!/usr/bin/env bash
#
# Install some Node versions with n
if [ ! -d /usr/local/n ]; then
    sudo mkdir -p /usr/local/n
    sudo chown $(whoami):$(groups | cut -d" " -f1) /usr/local/n
fi

# Install and activate the LTS version
n lts && n lts
