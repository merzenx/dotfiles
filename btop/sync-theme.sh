#!/usr/bin/env bash
set -euo pipefail

DMS_COLORS="${DMS_COLORS:-$HOME/.cache/DankMaterialShell/dms-colors.json}"
THEME_DIR="$HOME/.config/btop/themes"
THEME_FILE="$THEME_DIR/dank-material.theme"

if [[ ! -f "$DMS_COLORS" ]]; then
  echo "error: $DMS_COLORS not found" >&2
  exit 1
fi

mkdir -p "$THEME_DIR"

cat > "$THEME_FILE" << 'HEADER'
# Dank Material Shell theme for btop
# Generated from dms-colors.json

HEADER

jq -r '
  .colors.dark as $d |
  .dank16 as $a |
  "theme[main_bg]=\"\($d.background)\"\n" +
  "theme[main_fg]=\"\($d.on_surface)\"\n" +
  "theme[title]=\"\($d.on_surface)\"\n" +
  "theme[hi_fg]=\"\($d.primary)\"\n" +
  "theme[selected_bg]=\"\($d.surface_container_high)\"\n" +
  "theme[selected_fg]=\"\($d.primary)\"\n" +
  "theme[inactive_fg]=\"\($d.outline)\"\n" +
  "theme[graph_text]=\"\($d.outline)\"\n" +
  "theme[proc_misc]=\"\($a.color2.default)\"\n" +
  "theme[cpu_box]=\"\($d.outline)\"\n" +
  "theme[mem_box]=\"\($d.outline)\"\n" +
  "theme[net_box]=\"\($d.outline)\"\n" +
  "theme[proc_box]=\"\($d.outline)\"\n" +
  "theme[div_line]=\"\($d.outline)\"\n" +
  "theme[temp_start]=\"\($a.color6.default)\"\n" +
  "theme[temp_mid]=\"\($a.color5.default)\"\n" +
  "theme[temp_end]=\"\($a.color9.default)\"\n" +
  "theme[cpu_start]=\"\($a.color2.default)\"\n" +
  "theme[cpu_mid]=\"\($a.color3.default)\"\n" +
  "theme[cpu_end]=\"\($a.color9.default)\"\n" +
  "theme[free_start]=\"\($a.color2.default)\"\n" +
  "theme[free_mid]=\"\"\n" +
  "theme[free_end]=\"\($a.color2.default)\"\n" +
  "theme[cached_start]=\"\($a.color6.default)\"\n" +
  "theme[cached_mid]=\"\"\n" +
  "theme[cached_end]=\"\($a.color6.default)\"\n" +
  "theme[available_start]=\"\($a.color3.default)\"\n" +
  "theme[available_mid]=\"\"\n" +
  "theme[available_end]=\"\($a.color3.default)\"\n" +
  "theme[used_start]=\"\($a.color9.default)\"\n" +
  "theme[used_mid]=\"\"\n" +
  "theme[used_end]=\"\($a.color9.default)\"\n" +
  "theme[download_start]=\"\($a.color4.default)\"\n" +
  "theme[download_mid]=\"\($a.color5.default)\"\n" +
  "theme[download_end]=\"\($a.color6.default)\"\n" +
  "theme[upload_start]=\"\($a.color9.default)\"\n" +
  "theme[upload_mid]=\"\($a.color5.default)\"\n" +
  "theme[upload_end]=\"\($a.color3.default)\""
' "$DMS_COLORS" >> "$THEME_FILE"

echo "syncing btop theme.."
