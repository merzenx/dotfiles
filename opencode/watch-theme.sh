#!/usr/bin/env bash
set -euo pipefail

DMS_COLORS="${DMS_COLORS:-$HOME/.cache/DankMaterialShell/dms-colors.json}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "watching $DMS_COLORS for changes.."

while true; do
  inotifywait -q -e modify,close_write,moved_to "$DMS_COLORS" 2>/dev/null
  "$SCRIPT_DIR/sync-theme.sh"
done
