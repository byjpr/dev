#!/bin/sh

# Create swap file
sudo fallocate -l 10G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.vfs_cache_pressure=50 && sudo sysctl vm.swappiness=10

# Base needs
sudo apt install curl git

# Install ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
git -C ~/.asdf checkout "$(git -C ~/.asdf describe --abbrev=0 --tags)"

echo ". $HOME/.asdf/asdf.sh" > .bash_aliases
echo ". $HOME/.asdf/completions/asdf.bash" > .bash_aliases

# Reload bash
. ~/.bashrc

# Add Elixir and Erlang
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf update
asdf plugin-update --all

sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
asdf install erlang 22.0.3
asdf global erlang 22.0.3

asdf install elixir 1.10.0-otp-22
asdf global elixir 1.10.0-otp-2
