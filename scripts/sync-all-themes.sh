#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../opencode/sync-theme.sh"
"$SCRIPT_DIR/../nvim/sync-theme.sh"
"$SCRIPT_DIR/../helix/sync-theme.sh"
"$SCRIPT_DIR/../btop/sync-theme.sh"
"$SCRIPT_DIR/../lazygit/sync-theme.sh"
"$SCRIPT_DIR/../discord/sync-theme.sh"


echo "All themes synced"
