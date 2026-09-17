#!/usr/bin/env bash
set -euo pipefail

# Keep the Dock out of the way unless hovered.
defaults write com.apple.dock orientation -string right
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.2

killall Dock
