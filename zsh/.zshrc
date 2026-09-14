# Add `~/bin` and `~/.local/bin` to the `$PATH`
export PATH="$HOME/bin:$HOME/.local/bin:$PATH";

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh";
ZSH_THEME="robbyrussell";
plugins=(git macos brew);

# Docker CLI completions
if [ -d "$HOME/.docker/completions" ]; then
	fpath=($HOME/.docker/completions $fpath)
fi

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
	source "$ZSH/oh-my-zsh.sh";
else
	autoload -Uz compinit
	compinit
fi

# Google Cloud SDK
if [ -f "$HOME/dev/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/dev/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/dev/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/dev/google-cloud-sdk/completion.zsh.inc"; fi
export PATH="$PATH:$HOME/google-cloud-sdk/bin"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
[ -f ~/.path ] && source ~/.path;
[ -f "$HOME/dev/dotfiles/shell/.exports" ] && source "$HOME/dev/dotfiles/shell/.exports";
[ -f "$HOME/dev/dotfiles/shell/.aliases" ] && source "$HOME/dev/dotfiles/shell/.aliases";
[ -f "$HOME/dev/dotfiles/shell/.functions" ] && source "$HOME/dev/dotfiles/shell/.functions";
[ -f ~/.extra ] && source ~/.extra;

# Case-insensitive globbing (used in pathname expansion)
setopt nocaseglob;

# Append to the history file, rather than overwriting it, and avoid duplicates
setopt appendhistory;
setopt histignoredups;
setopt histignorespace;

# Correct typos in path names when using `cd`
setopt nocorrect;
