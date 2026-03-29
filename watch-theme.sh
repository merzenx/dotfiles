#!/usr/bin/env bash
set -euo pipefail

DMS_COLORS="${DMS_COLORS:-$HOME/.cache/DankMaterialShell/dms-colors.json}"
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "watching $DMS_COLORS for changes.."

while true; do
  inotifywait -q -e modify,close_write,moved_to "$DMS_COLORS" 2>/dev/null
  "$DOTFILES/scripts/sync-all-themes.sh"
done
