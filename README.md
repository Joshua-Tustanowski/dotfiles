# Joshua's dotfiles

Personal dotfiles split into portable `shared/` config and OS-specific setup.

## Layout

```text
shared/          portable shell/Git/readline config
shared/bash/     Bash entry points and prompt
shared/shell/    shared aliases, exports, and functions
macos/           macOS-only setup
macos/zsh/       Zsh + oh-my-zsh config
macos/.macos     macOS defaults
macos/brew.sh    Homebrew packages
install.sh       DevPod/container installer
bootstrap.sh     local macOS installer
```

## Core portable bits

These are the files worth reusing across macOS, Linux, and DevPod/container startup:

```text
shared/shell/.aliases
shared/shell/.exports
shared/shell/.functions
shared/bash/.bashrc
shared/bash/.bash_profile
shared/.gitconfig
shared/.gitignore
shared/.gitattributes
shared/.inputrc
```

Container/Linux startup should use `shared/` and skip anything that assumes macOS, Homebrew, Finder, `pbcopy`, or local absolute paths.

## DevPod/container install

`install.sh` is the Linux-safe entry point for DevPod dotfiles. It copies `shared/` into `$HOME` and symlinks Bash entry points:

- `~/.bash_profile` → `~/bash/.bash_profile`
- `~/.bashrc` → `~/bash/.bashrc`

Use `~/.extra` for work/container-only settings and secrets.

## Local Mac install

```bash
git clone git@github-personal:Joshua-Tustanowski/dotfiles.git ~/dotfiles
cd ~/dotfiles
source bootstrap.sh
```

`bootstrap.sh` syncs `shared/`, installs the macOS Zsh config, installs oh-my-zsh if needed, and symlinks:

- `~/.bash_profile` → `~/bash/.bash_profile`
- `~/.bashrc` → `~/bash/.bashrc`
- `~/.zshrc` → `~/zsh/.zshrc`

Existing non-symlink shell entry files are backed up once as `*.pre-dotfiles-backup`.

## Local-only config

These files are intentionally outside the repo:

- `~/.path` — extra `$PATH` entries, loaded before the shared shell files
- `~/.extra` — secrets, machine-specific aliases, overrides
- `~/.gitconfig-personal` — personal Git identity for repos under `~/Personal/`

Create personal Git config from the example:

```bash
cp shared/.gitconfig-personal.example ~/.gitconfig-personal
```

## New Mac checklist

```bash
source bootstrap.sh
./macos/.macos
./macos/brew.sh
```

Read scripts before running them. They change shell files, macOS defaults, and Homebrew packages.
