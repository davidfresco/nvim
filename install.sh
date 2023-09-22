#!/bin/bash

if which dnf &>/dev/null; then
	sudo dnf -y install ninja-build cmake gcc make unzip gettext curl git
elif which apt-get &>/dev/null; then
	sudo apt-get -y install ninja-build gettext cmake unzip curl git
elif which zypper &>/dev/null; then
	sudo zypper -y install ninja cmake gcc-c++ gettext-tools curl git
elif which pacman &>/dev/null; then
	sudo pacman -Sy base-devel cmake unzip ninja curl git
else
	echo "unsupported package manager lol" >&2
	exit 1
fi

git clone https://github.com/neovim/neovim ~/neovim
cd ~/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
nvim --headless "+Lazy! sync" +qa
