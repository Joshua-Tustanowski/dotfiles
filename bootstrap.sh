#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")";

git pull --ff-only origin main;

function doIt() {
	rsync --exclude ".DS_Store" \
		--exclude ".gitconfig-personal.example" \
		-avh --no-perms shared/ "$HOME/";
	rsync -avh --no-perms macos/zsh/ "$HOME/zsh/";

	# Install oh-my-zsh if it isn't already present
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh";
	fi;

	# Symlink shell entry points to the installed copies, backing up existing
	# non-symlinks once.
	local entry;
	for entry in ".bash_profile:bash/.bash_profile" ".bashrc:bash/.bashrc" ".zshrc:zsh/.zshrc"; do
		local target="${entry%%:*}";
		local relative_source="${entry#*:}";
		if [ -e "$HOME/$target" ] && [ ! -L "$HOME/$target" ]; then
			mv "$HOME/$target" "$HOME/$target.pre-dotfiles-backup";
		fi;
		ln -sf "$HOME/$relative_source" "$HOME/$target";
	done;

	source "$HOME/bash/.bash_profile";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
