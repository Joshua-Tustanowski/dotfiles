# Mathias’s dotfiles (Joshua's Adaptation)

![Screenshot of my shell prompt](https://i.imgur.com/EkEtphC.png)

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

To update later on, just run that command again.

Running it will, among other things:
- symlink `~/.bash_profile`, `~/.bashrc` and `~/.zshrc` to the real files in this repo's [bash/](bash/) and [zsh/](zsh/) folders (backing up anything already at those paths to `*.pre-dotfiles-backup`, once);
- install [oh-my-zsh](https://ohmyz.sh/) into `~/.oh-my-zsh` if it isn't already there.

### Bash and Zsh

Both shells are supported. `bash/.aliases`, `bash/.exports` and `bash/.functions` are shared between them; `bash/.bash_profile`/`bash/.bashrc` and `zsh/.zshrc` are shell-specific entry points. The Zsh config uses oh-my-zsh — edit `ZSH_THEME` and `plugins` in [zsh/.zshrc](zsh/.zshrc) to taste.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-L26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Mathias Bynens"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="mathias@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

### Use a different git identity for personal projects

`.gitconfig` includes a conditional include (`[includeIf "gitdir:~/Personal/"]`) that
loads `~/.gitconfig-personal` for any repo cloned under `~/Personal/`, so those repos
use a different name/email (and, if you add one, a different signing key or
`core.sshCommand`) than your default git identity.

Copy [.gitconfig-personal.example](.gitconfig-personal.example) to `~/.gitconfig-personal`
(outside the repo, so it's never committed) and fill in your own values:

```bash
cp .gitconfig-personal.example ~/.gitconfig-personal
```

### Clone personal GitHub repositories

The `.gitconfig` includes two convenient shortcuts for cloning personal GitHub repositories using the `github-personal` SSH key:

**Alias:**
```bash
git clone-personal Joshua-Tustanowski/dotfiles
git clone-personal Joshua-Tustanowski/dotfiles my-custom-dir
```

**URL shorthand:**
```bash
git clone ghp:Joshua-Tustanowski/dotfiles
```

Both methods automatically use your personal GitHub SSH key (`id_e25519_github_personal`) for authentication.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.
