#!/usr/bin/env bash
set -euo pipefail

DMS_COLORS="${DMS_COLORS:-$HOME/.cache/DankMaterialShell/dms-colors.json}"
THEME_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/helix/themes"
THEME_FILE="$THEME_DIR/dank.toml"

if [[ ! -f "$DMS_COLORS" ]]; then
  echo "error: $DMS_COLORS not found" >&2
  exit 1
fi

mkdir -p "$THEME_DIR"

cat > "$THEME_FILE" << 'HEADER'
# Helix theme - Dank Material Shell
# Generated from dms-colors.json

[palette]
HEADER

jq -r '
  .colors.dark as $d |
  .dank16 as $a |
  [
    "d_bg = \"\($d.background)\"",
    "d_surface = \"\($d.surface_container)\"",
    "d_surface2 = \"\($d.surface_container_high)\"",
    "d_surface3 = \"\($d.surface_container_highest)\"",
    "d_surface4 = \"\($d.surface_bright)\"",
    "d_fg = \"\($d.on_surface)\"",
    "d_fg1 = \"\($d.on_surface_variant)\"",
    "d_muted = \"\($d.outline)\"",
    "d_primary = \"\($d.primary)\"",
    "d_primary_c = \"\($d.primary_container)\"",
    "d_secondary = \"\($d.secondary)\"",
    "d_tertiary = \"\($d.tertiary)\"",
    "d_error = \"\($d.error)\"",
    "d_c0 = \"\($a.color0.default)\"",
    "d_c1 = \"\($a.color1.default)\"",
    "d_c2 = \"\($a.color2.default)\"",
    "d_c3 = \"\($a.color3.default)\"",
    "d_c4 = \"\($a.color4.default)\"",
    "d_c5 = \"\($a.color5.default)\"",
    "d_c6 = \"\($a.color6.default)\"",
    "d_c7 = \"\($a.color7.default)\"",
    "d_c8 = \"\($a.color8.default)\"",
    "d_c9 = \"\($a.color9.default)\"",
    "d_c10 = \"\($a.color10.default)\"",
    "d_c11 = \"\($a.color11.default)\"",
    "d_c12 = \"\($a.color12.default)\"",
    "d_c13 = \"\($a.color13.default)\"",
    "d_c14 = \"\($a.color14.default)\"",
    "d_c15 = \"\($a.color15.default)\""
  ] | .[]
' "$DMS_COLORS" >> "$THEME_FILE"

cat >> "$THEME_FILE" << 'THEME'

# UI
"ui.background" = { bg = "d_bg" }
"ui.text" = "d_fg"
"ui.text.focus" = { fg = "d_fg", modifiers = ["bold"] }
"ui.text.info" = "d_muted"
"ui.virtual.whitespace" = "d_muted"
"ui.virtual.ruler" = { bg = "d_surface" }
"ui.virtual.indent-guide" = "d_surface3"
"ui.virtual.inlay-hint" = { fg = "d_muted", modifiers = ["italic"] }
"ui.cursor" = { fg = "#000000", bg = "#fdfff8" }
"ui.cursor.match" = { fg = "#000000", bg = "d_c3", modifiers = ["bold"] }
"ui.cursor.primary" = { fg = "#000000", bg = "#fdfff8" }
"ui.cursor.secondary" = { fg = "#000000", bg = "d_secondary" }
"ui.cursor.insert" = { fg = "#000000", bg = "#fdfff8" }
"ui.cursor.select" = { fg = "#000000", bg = "d_primary" }
"ui.selection" = { bg = "d_primary_c" }
"ui.cursorline.primary" = { bg = "d_surface2" }
"ui.cursorline.secondary" = { bg = "d_surface2" }
"ui.linenr" = "d_muted"
"ui.linenr.selected" = "d_fg"
"ui.statusline" = { fg = "d_fg", bg = "d_surface2" }
"ui.statusline.inactive" = { fg = "d_muted", bg = "d_surface" }
"ui.statusline.normal" = { fg = "d_surface", bg = "d_primary", modifiers = ["bold"] }
"ui.statusline.insert" = { fg = "d_surface", bg = "d_secondary", modifiers = ["bold"] }
"ui.statusline.select" = { fg = "d_surface", bg = "d_tertiary", modifiers = ["bold"] }
"ui.popup" = { fg = "d_fg", bg = "d_surface2" }
"ui.popup.info" = { fg = "d_fg", bg = "d_surface2" }
"ui.window" = { fg = "d_surface3", bg = "d_bg" }
"ui.help" = { fg = "d_fg", bg = "d_surface2", modifiers = ["bold"] }
"ui.bufferline" = { fg = "d_muted", bg = "d_surface" }
"ui.bufferline.active" = { fg = "d_fg", bg = "d_surface2", modifiers = ["bold"] }
"ui.bufferline.background" = { bg = "d_surface" }
"ui.menu" = { fg = "d_fg", bg = "d_surface2" }
"ui.menu.selected" = { fg = "#000000", bg = "d_primary" }
"ui.menu.scroll" = { fg = "d_muted", bg = "d_surface2" }
"ui.gutter" = {}

# Diagnostics
"diagnostic.error" = { fg = "d_error", modifiers = ["undercurl"] }
"diagnostic.warning" = { fg = "d_c3", modifiers = ["undercurl"] }
"diagnostic.info" = { fg = "d_c6", modifiers = ["undercurl"] }
"diagnostic.hint" = { fg = "d_primary", modifiers = ["undercurl"] }
"warning" = "d_c3"
"error" = "d_error"
"info" = "d_c6"
"hint" = "d_primary"

# Diff
"diff.plus" = "d_c10"
"diff.minus" = "d_c1"
"diff.delta" = "d_c3"

# Syntax
"comment" = { fg = "d_c8", modifiers = ["italic"] }
"keyword" = "d_primary"
"operator" = "d_fg"
"punctuation" = "d_fg"
"variable" = "d_fg"
"variable.builtin" = "d_secondary"
"variable.parameter" = "d_c12"
"variable.other" = "d_fg"
"variable.other.member" = "d_fg"
"constant" = "d_secondary"
"constant.numeric" = "d_c13"
"constant.character" = "d_c9"
"constant.character.escape" = "d_primary"
"constant.builtin" = "d_secondary"
"string" = "d_c10"
"string.regexp" = "d_primary"
"string.special" = "d_primary"
"function" = "d_primary"
"function.builtin" = "d_primary"
"function.macro" = "d_secondary"
"constructor" = "d_secondary"
"tag" = "d_primary"
"namespace" = "d_secondary"
"special" = "d_secondary"
"type" = "d_tertiary"
"type.builtin" = "d_tertiary"
"attribute" = "d_secondary"
"module" = "d_secondary"
"label" = "d_primary"
"escape" = "d_primary"

# Markup
"markup.bold" = { modifiers = ["bold"] }
"markup.italic" = { modifiers = ["italic"] }
"markup.heading" = { fg = "d_primary", modifiers = ["bold"] }
"markup.list" = "d_primary"
"markup.link" = "d_secondary"
"markup.quote" = { fg = "d_c8", modifiers = ["italic"] }
"markup.raw" = "d_c10"
THEME

echo "syncing helix theme.."
