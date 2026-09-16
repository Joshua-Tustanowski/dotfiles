# Joshua's dotfiles

My macOS shell setup, based on Mathias Bynens' dotfiles and trimmed for how I work.

## What's in here

- Bash and Zsh config
- shared aliases, exports, and shell functions
- Git defaults and aliases
- macOS defaults script
- Homebrew install script
- oh-my-zsh setup for Zsh

## Install

```bash
git clone git@github-personal:Joshua-Tustanowski/dotfiles.git ~/dotfiles
cd ~/dotfiles
source bootstrap.sh
```

Run it again any time to pull the latest changes and re-sync the files.

`bootstrap.sh` copies the repo into `$HOME`, installs oh-my-zsh if needed, and symlinks:

- `~/.bash_profile` → `~/bash/.bash_profile`
- `~/.bashrc` → `~/bash/.bashrc`
- `~/.zshrc` → `~/zsh/.zshrc`

Existing non-symlink shell entry files are backed up once as `*.pre-dotfiles-backup`.

## Layout

```text
bash/      Bash entry points and prompt
zsh/       Zsh entry point, oh-my-zsh config, completions
shell/     shared aliases, exports, and functions
.macos     macOS defaults
brew.sh    Homebrew packages
.gitconfig Git aliases and defaults
```

## Local-only config

These files are intentionally outside the repo:

- `~/.path` — extra `$PATH` entries, loaded before the shared shell files
- `~/.extra` — secrets, machine-specific aliases, overrides
- `~/.gitconfig-personal` — personal Git identity for repos under `~/Personal/`

Create personal Git config from the example:

```bash
cp .gitconfig-personal.example ~/.gitconfig-personal
```

## New Mac checklist

```bash
source bootstrap.sh
./.macos
./brew.sh
```

Read scripts before running them. They change shell files, macOS defaults, and Homebrew packages.
