#!/usr/bin/env bash
set -euo pipefail

DMS_COLORS="${DMS_COLORS:-$HOME/.cache/DankMaterialShell/dms-colors.json}"
CONFIG_FILE="$HOME/.config/lazygit/config.yml"

if [[ ! -f "$DMS_COLORS" ]]; then
  echo "error: $DMS_COLORS not found" >&2
  exit 1
fi

CONFIG_DIR="$(dirname "$CONFIG_FILE")"
mkdir -p "$CONFIG_DIR"

primary=$(jq -r '.colors.dark.primary' "$DMS_COLORS")
outline=$(jq -r '.colors.dark.outline' "$DMS_COLORS")
surface_high=$(jq -r '.colors.dark.surface_container_high' "$DMS_COLORS")
surface=$(jq -r '.colors.dark.surface_container' "$DMS_COLORS")
on_surface=$(jq -r '.colors.dark.on_surface' "$DMS_COLORS")
c2=$(jq -r '.dank16.color2.default' "$DMS_COLORS")
c9=$(jq -r '.dank16.color9.default' "$DMS_COLORS")

cat > "$CONFIG_FILE" << EOF
gui:
  theme:
    activeBorderColor:
      - '$primary'
      - bold
    inactiveBorderColor:
      - '$outline'
    optionsTextColor:
      - '$primary'
    selectedLineBgColor:
      - '$surface_high'
    cherryPickedCommitBgColor:
      - '$surface'
    cherryPickedCommitFgColor:
      - '$c2'
    unstagedChangesColor:
      - '$c9'
    defaultFgColor:
      - '$on_surface'
    searchingActiveBorderColor:
      - '$primary'
  showIcons: true
  nerdFontsVersion: "3"
EOF

echo "syncing lazygit theme.."
