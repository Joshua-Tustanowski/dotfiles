#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --yes

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install --yes coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install --yes moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install --yes findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install --yes gnu-sed --with-default-names
# Install a modern version of Bash.
brew install --yes bash
brew install --yes bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install --yes wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install --yes gnupg

# Install more recent versions of some macOS tools.
brew install --yes vim --with-override-system-vi
brew install --yes grep
brew install --yes openssh
brew install --yes screen
brew install --yes php
brew install --yes gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install --yes sfnt2woff
brew install --yes sfnt2woff-zopfli
brew install --yes woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install --yes aircrack-ng
brew install --yes bfg
brew install --yes binutils
brew install --yes binwalk
brew install --yes cifer
brew install --yes dex2jar
brew install --yes dns2tcp
brew install --yes fcrackzip
brew install --yes foremost
brew install --yes hashpump
brew install --yes hydra
brew install --yes john
brew install --yes knock
brew install --yes netpbm
brew install --yes nmap
brew install --yes pngcheck
brew install --yes socat
brew install --yes sqlmap
brew install --yes tcpflow
brew install --yes tcpreplay
brew install --yes tcptrace
brew install --yes ucspi-tcp # `tcpserver` etc.
brew install --yes xpdf
brew install --yes xz

# Install GUI apps via Homebrew Cask.
brew install --yes --cask docker

# Install other useful binaries.
brew install --yes ack
#brew install exiv2
brew install --yes git
brew install --yes git-lfs
brew install --yes gs
brew install --yes imagemagick --with-webp
brew install --yes lua
brew install --yes lynx
brew install --yes p7zip
brew install --yes pigz
brew install --yes pv
brew install --yes rename
brew install --yes rlwrap
brew install --yes ssh-copy-id
brew install --yes tree
brew install --yes vbindiff
brew install --yes zopfli

# Remove outdated versions from the cellar.
brew cleanup
