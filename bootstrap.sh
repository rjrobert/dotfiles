#!/usr/bin/env bash
set -euo pipefail

# 1. Install Nix if not already installed
if ! command -v nix &>/dev/null; then
  echo "Installing Nix..."
  curl -L https://install.determinate.systems/nix | sh
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

# 2. Enable flakes
mkdir -p ~/.config/nix
if ! grep -q "experimental-features" ~/.config/nix/nix.conf 2>/dev/null; then
  echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf
fi

# 3. Run Home Manager with your flake
echo "Bootstrapping Home Manager..."
nix run home-manager/master -- switch --flake ~/dotfiles#robert
