#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude ".gitconfig-personal.example" \
		-avh --no-perms . ~;

	# Install oh-my-zsh if it isn't already present
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh";
	fi;

	# The files above are installed into `$HOME/bash`, `$HOME/zsh`, and
	# `$HOME/shell`. Symlink the shells' top-level entry points to those
	# installed copies (backing up anything already there, once).
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
