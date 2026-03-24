#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
SERVICE="watch-theme.service"

echo "installing inotify-tools.."
sudo pacman -S --needed --noconfirm inotify-tools

echo "running initial theme sync.."
"$DOTFILES/scripts/sync-all-theme.sh"

echo "installing systemd user service.."
mkdir -p ~/.config/systemd/user
cp "$DOTFILES/$SERVICE" ~/.config/systemd/user/
sed -i "s|%h|$HOME|g" ~/.config/systemd/user/"$SERVICE"

systemctl --user daemon-reload
systemctl --user enable --now "$SERVICE"

echo "done. service status:"
systemctl --user status "$SERVICE" --no-pager
