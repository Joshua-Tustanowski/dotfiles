# Add `~/bin` and `~/.local/bin` to the `$PATH`
export PATH="$HOME/bin:$HOME/.local/bin:$PATH";

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh";
ZSH_THEME="robbyrussell";
plugins=(git macos brew);
source "$ZSH/oh-my-zsh.sh";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit
#   (e.g. machine-specific SDK path/completion snippets).
dotfiles_zsh_dir="${0:A:h}";
dotfiles_root="${dotfiles_zsh_dir:h}";
for file in ~/.path "$dotfiles_root"/bash/.exports "$dotfiles_root"/bash/.aliases "$dotfiles_root"/bash/.functions ~/.extra; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
unset dotfiles_zsh_dir;
unset dotfiles_root;

# Case-insensitive globbing (used in pathname expansion)
setopt nocaseglob;

# Append to the history file, rather than overwriting it, and avoid duplicates
setopt appendhistory;
setopt histignoredups;
setopt histignorespace;

# Correct typos in path names when using `cd`
setopt correct;
