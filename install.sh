#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

shopt -s dotglob nullglob
for path in shared/*; do
	name="$(basename "$path")"
	[ "$name" = ".gitconfig-personal.example" ] && continue
	cp -R "$path" "$HOME/"
done

ln -sf "$HOME/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$HOME/bash/.bash_profile" "$HOME/.bash_profile"
