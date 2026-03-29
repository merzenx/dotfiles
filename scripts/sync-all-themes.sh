#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../opencode/sync-theme.sh"
"$SCRIPT_DIR/../nvim/sync-theme.sh"
"$SCRIPT_DIR/../helix/sync-theme.sh"

echo "All themes synced"
