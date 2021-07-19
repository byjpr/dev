#!/bin/sh

sudo apt install curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
git -C ~/.asdf checkout "$(git -C ~/.asdf describe --abbrev=0 --tags)"

echo ". $HOME/.asdf/asdf.sh" > .bash_aliases
echo ". $HOME/.asdf/completions/asdf.bash" > .bash_aliases

. ~/.bash_profile

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf update
asdf plugin-update --all
