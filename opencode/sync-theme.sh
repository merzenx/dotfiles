#!/usr/bin/env bash
set -euo pipefail

DMS_COLORS="${DMS_COLORS:-$HOME/.cache/DankMaterialShell/dms-colors.json}"
THEME_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/themes"
THEME_FILE="$THEME_DIR/dank-material.json"

if [[ ! -f "$DMS_COLORS" ]]; then
  echo "error: $DMS_COLORS not found" >&2
  exit 1
fi

mkdir -p "$THEME_DIR"

jq -n --slurpfile dms "$DMS_COLORS" '
  ($dms[0].colors.dark) as $d |
  ($dms[0].colors.light) as $l |
  ($dms[0].dank16) as $a |

  {
    "$schema": "https://opencode.ai/theme.json",
    defs: {
      d_bg:         $d.background,
      d_surface:    $d.surface_container,
      d_surface2:   $d.surface_container_high,
      d_surface3:   $d.surface_container_highest,
      d_surface4:   $d.surface_bright,
      d_fg:         $d.on_surface,
      d_fg1:        $d.on_surface_variant,
      d_muted:      $d.outline,
      d_primary:    $d.primary,
      d_primary_c:  $d.primary_container,
      d_secondary:  $d.secondary,
      d_tertiary:   $d.tertiary,
      d_error:      $d.error,
      d_c0:         $a.color0.default,
      d_c1:         $a.color1.default,
      d_c2:         $a.color2.default,
      d_c3:         $a.color3.default,
      d_c4:         $a.color4.default,
      d_c5:         $a.color5.default,
      d_c6:         $a.color6.default,
      d_c7:         $a.color7.default,
      d_c8:         $a.color8.default,
      d_c9:         $a.color9.default,
      d_c10:        $a.color10.default,
      d_c11:        $a.color11.default,
      d_c12:        $a.color12.default,
      d_c13:        $a.color13.default,
      d_c14:        $a.color14.default,
      d_c15:        $a.color15.default,
      l_bg:         $l.background,
      l_surface:    $l.surface_container,
      l_surface2:   $l.surface_container_high,
      l_surface3:   $l.surface_container_highest,
      l_fg:         $l.on_surface,
      l_fg1:        $l.on_surface_variant,
      l_muted:      $l.outline,
      l_primary:    $l.primary,
      l_primary_c:  $l.primary_container,
      l_secondary:  $l.secondary,
      l_tertiary:   $l.tertiary,
      l_error:      $l.error,
      l_c0:         $a.color0.default,
      l_c1:         $a.color1.default,
      l_c2:         $a.color2.default,
      l_c3:         $a.color3.default,
      l_c4:         $a.color4.default,
      l_c5:         $a.color5.default,
      l_c6:         $a.color6.default,
      l_c7:         $a.color7.default,
      l_c8:         $a.color8.default,
      l_c9:         $a.color9.default,
      l_c10:        $a.color10.default,
      l_c11:        $a.color11.default,
      l_c12:        $a.color12.default,
      l_c13:        $a.color13.default,
      l_c14:        $a.color14.default,
      l_c15:        $a.color15.default
    },
    theme: {
      primary:              { dark: "d_primary",  light: "l_primary"  },
      secondary:            { dark: "d_secondary",light: "l_secondary"},
      accent:               { dark: "d_c3",       light: "l_c3"       },
      error:                { dark: "d_error",    light: "l_error"    },
      warning:              { dark: "d_c3",       light: "l_c3"       },
      success:              { dark: "d_c2",       light: "l_c2"       },
      info:                 { dark: "d_c6",       light: "l_c6"       },
      text:                 { dark: "d_fg",       light: "l_fg"       },
      textMuted:            { dark: "d_muted",    light: "l_muted"    },
      background:           { dark: "d_bg",       light: "l_bg"       },
      backgroundPanel:      { dark: "d_surface",  light: "l_surface"  },
      backgroundElement:    { dark: "d_surface2", light: "l_surface"  },
      border:               { dark: "d_surface3", light: "l_muted"    },
      borderActive:         { dark: "d_muted",    light: "l_fg"       },
      borderSubtle:         { dark: "d_surface2", light: "l_surface"  },
      diffAdded:            { dark: "d_c2",       light: "l_c2"       },
      diffRemoved:          { dark: "d_c1",       light: "l_c1"       },
      diffContext:          { dark: "d_muted",    light: "l_muted"    },
      diffHunkHeader:       { dark: "d_surface4", light: "l_muted"    },
      diffHighlightAdded:   { dark: "d_c10",      light: "l_c10"      },
      diffHighlightRemoved: { dark: "d_c9",       light: "l_c9"       },
      diffAddedBg:          { dark: "d_surface",  light: "l_surface"  },
      diffRemovedBg:        { dark: "d_surface",  light: "l_surface"  },
      diffContextBg:        { dark: "d_surface",  light: "l_surface"  },
      diffLineNumber:       { dark: "d_surface4", light: "l_muted"    },
      diffAddedLineNumberBg:{ dark: "d_surface",  light: "l_surface"  },
      diffRemovedLineNumberBg:{ dark: "d_surface",light: "l_surface"  },
      markdownText:         { dark: "d_fg",       light: "l_fg"       },
      markdownHeading:      { dark: "d_primary",  light: "l_primary"  },
      markdownLink:         { dark: "d_secondary",light: "l_secondary"},
      markdownLinkText:     { dark: "d_c3",       light: "l_c3"       },
      markdownCode:         { dark: "d_c10",      light: "l_c10"      },
      markdownBlockQuote:   { dark: "d_muted",    light: "l_muted"    },
      markdownEmph:         { dark: "d_c3",       light: "l_c3"       },
      markdownStrong:       { dark: "d_c11",      light: "l_c11"      },
      markdownHorizontalRule:{ dark: "d_surface3", light: "l_muted"   },
      markdownListItem:     { dark: "d_primary",  light: "l_primary"  },
      markdownListEnumeration:{ dark: "d_secondary",light: "l_secondary"},
      markdownImage:        { dark: "d_secondary",light: "l_secondary"},
      markdownImageText:    { dark: "d_c3",       light: "l_c3"       },
      markdownCodeBlock:    { dark: "d_fg1",      light: "l_fg"       },
      syntaxComment:        { dark: "d_c8",       light: "l_c8"       },
      syntaxKeyword:        { dark: "d_c4",       light: "l_c4"       },
      syntaxFunction:       { dark: "d_c10",      light: "l_c10"      },
      syntaxVariable:       { dark: "d_c3",       light: "l_c3"       },
      syntaxString:         { dark: "d_c1",       light: "l_c1"       },
      syntaxNumber:         { dark: "d_c5",       light: "l_c5"       },
      syntaxType:           { dark: "d_c6",       light: "l_c6"       },
      syntaxOperator:       { dark: "d_c4",       light: "l_c4"       },
      syntaxPunctuation:    { dark: "d_fg",       light: "l_fg"       }
    }
  }
' > "$THEME_FILE"

echo "syncing opencode theme.."
