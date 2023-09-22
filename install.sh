#!/bin/bash

extra_deps="git npm"
language_servers=( "pyright" "jedi-language-server" )

if which dnf &>/dev/null; then
	sudo dnf -y install ninja-build cmake gcc make unzip gettext curl python3-venv $extra_deps
elif which apt-get &>/dev/null; then
	sudo apt-get -y install ninja-build gettext cmake unzip curl python3-venv $extra_deps
elif which zypper &>/dev/null; then
	sudo zypper -y install ninja cmake gcc-c++ gettext-tools curl $extra_deps
elif which pacman &>/dev/null; then
	sudo pacman -Sy base-devel cmake unzip ninja curl $extra_deps
else
	echo "unsupported package manager lol" >&2
	exit 1
fi

git clone https://github.com/neovim/neovim ~/neovim
cd ~/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
mkdir ~/.config
git clone https://github.com/davidfresco/nvim ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
for lang_server in ${language_servers[@]}; do
    nvim --headless "+MasonInstall $lang_server" +qa
done
