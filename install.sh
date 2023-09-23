#!/bin/bash

build_reqs="ninja-build cmake gcc gcc-c++ make unzip gettext curl base-devel"
extra_deps="git npm, python3-venv"
language_servers=("pyright" "jedi-language-server")

if which dnf &>/dev/null; then
	PACKAGE_MANAGER_CMD="dnf install -y"
elif which apt-get &>/dev/null; then
	PACKAGE_MANAGER_CMD="apt-get install -y"
elif which zypper &>/dev/null; then
	PACKAGE_MANAGER_CMD="zypper install -y"
elif which pacman &>/dev/null; then
	PACKAGE_MANAGER_CMD="pacman -Sy"
else
	echo "unsupported package manager lol" >&2
	exit 1
fi

for package in $build_reqs $extra_deps; do
	sudo $PACKAGE_MANAGER_CMD $package
done

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
