# #!/bin/bash
#
# JSON_FILE="$HOME/.cache/DankMaterialShell/dms-colors.json"
# OUTPUT_FILE="$HOME/.config/nvim/lua/config/theme.lua"
#
# if [ ! -f "$JSON_FILE" ]; then
#   echo "Error: $JSON_FILE not found"
#   exit 1
# fi
#
# OUTPUT_DIR="$(dirname "$OUTPUT_FILE")"
# mkdir -p "$OUTPUT_DIR"
#
# # Get all dark color keys
# dark_keys=$(jq -r '.colors.dark | keys | .[]' "$JSON_FILE")
#
# # Build colors table
# colors_lines=""
# for key in $dark_keys; do
#   value=$(jq -r ".colors.dark.$key" "$JSON_FILE")
#   colors_lines="${colors_lines}  ${key} = \"${value}\",
# "
# done
#
# # Get base16 keys
# base16_keys=$(jq -r '.dank16 | keys | .[]' "$JSON_FILE")
#
# base16_lines="  -- Base16 dark colors
# "
# for key in $base16_keys; do
#   value=$(jq -r ".dank16.$key.dark" "$JSON_FILE")
#   base16_lines="${base16_lines}  ${key} = \"${value}\",
# "
# done
#
# # Build nvim theme
# theme_lines='    Normal = { fg = colors.on_surface, bg = colors.surface },
#     NormalNC = { fg = colors.on_surface, bg = colors.surface },
#     NormalFloat = { fg = colors.on_surface, bg = colors.surface_container_high },
#     FloatBorder = { fg = colors.outline, bg = colors.surface_container_high },
#     FloatTitle = { fg = colors.on_surface, bg = colors.surface_container_high },
#     Cursor = { fg = colors.inverse_surface, bg = colors.inverse_on_surface },
#     lCursor = { link = "Cursor" },
#     CursorIM = { link = "Cursor" },
#     CursorLine = { bg = colors.surface_container_high },
#     CursorLineNr = { fg = colors.on_surface, bg = colors.surface_container_high },
#     LineNr = { fg = colors.on_surface_variant, bg = colors.surface },
#     LineNrFold = { fg = colors.on_surface_variant, bg = colors.surface },
#     FoldColumn = { fg = colors.on_surface_variant, bg = colors.surface },
#     SignColumn = { bg = colors.surface },
#     Conceal = { fg = colors.on_surface_variant, bg = colors.surface },
#     ColorColumn = { bg = colors.surface_container_high },
#     CursorColumn = { link = "CursorLine" },
#     Directory = { fg = colors.primary, bg = colors.surface },
#     EndOfBuffer = { fg = colors.surface, bg = colors.surface },
#     ErrorMsg = { fg = colors.on_error, bg = colors.error },
#     WinSeparator = { fg = colors.outline_variant, bg = colors.surface },
#     VertSplit = { link = "WinSeparator" },
#     Folded = { fg = colors.on_surface_variant, bg = colors.surface_container_high },
#     MatchParen = { fg = colors.primary, bg = colors.surface_container_high, bold = true },
#     ModeMsg = { fg = colors.on_surface, bg = colors.surface },
#     MsgArea = { fg = colors.on_surface, bg = colors.surface },
#     MsgSeparator = { link = "WinSeparator" },
#     MoreMsg = { fg = colors.primary },
#     NonText = { fg = colors.on_surface_variant, bg = colors.surface },
#     NormalSB = { fg = colors.on_surface, bg = colors.surface_container },
#     Pmenu = { fg = colors.on_surface, bg = colors.surface_container_high },
#     PmenuSel = { fg = colors.on_primary, bg = colors.primary },
#     PmenuSbar = { bg = colors.surface_container_high },
#     PmenuThumb = { bg = colors.outline },
#     Question = { fg = colors.primary },
#     QuickFixLine = { fg = colors.on_surface, bg = colors.primary_container },
#     Search = { fg = colors.inverse_on_surface, bg = colors.inverse_primary },
#     IncSearch = { link = "Search" },
#     Substitute = { fg = colors.inverse_on_surface, bg = colors.primary, standout = true },
#     SpecialKey = { fg = colors.primary },
#     SpellBad = { fg = colors.error, underline = true, sp = colors.error },
#     SpellCap = { fg = colors.tertiary, underline = true, sp = colors.tertiary },
#     SpellLocal = { fg = colors.secondary, underline = true, sp = colors.secondary },
#     SpellRare = { fg = colors.tertiary, underline = true, sp = colors.tertiary },
#     StatusLine = { fg = colors.on_surface, bg = colors.surface_container_high },
#     StatusLineNC = { fg = colors.on_surface_variant, bg = colors.surface_container_high },
#     TabLine = { fg = colors.on_surface_variant, bg = colors.surface_container },
#     TabLineFill = { fg = colors.on_surface_variant, bg = colors.surface_container },
#     TabLineSel = { fg = colors.on_surface, bg = colors.surface_container_high },
#     Title = { fg = colors.on_surface, bold = true },
#     Visual = { bg = colors.primary_container },
#     VisualNOS = { link = "Visual" },
#     WarningMsg = { fg = colors.on_error, bg = colors.error },
#     Whitespace = { fg = colors.outline_variant },
#     WildMenu = { fg = colors.on_surface, bg = colors.primary_container },
#     winbar = { fg = colors.on_surface, bg = colors.surface },
#     winbar_inactive = { fg = colors.on_surface_variant, bg = colors.surface },
# '
#
# # Syntax groups
# syntax_lines='    Comment = { fg = colors.on_surface_variant, italic = true },
#     Conditional = { fg = colors.primary },
#     Constant = { fg = colors.secondary },
#     String = { fg = colors.color10 },
#     Number = { fg = colors.color13 },
#     Boolean = { fg = colors.secondary },
#     Float = { fg = colors.color13 },
#     Character = { fg = colors.color9 },
#     Identifier = { fg = colors.on_surface },
#     Function = { fg = colors.primary },
#     Statement = { fg = colors.primary },
#     PreProc = { fg = colors.tertiary },
#     Include = { link = "PreProc" },
#     Define = { link = "PreProc" },
#     Macro = { link = "PreProc" },
#     PreCondit = { link = "PreProc" },
#     Keyword = { fg = colors.primary },
#     Repeat = { link = "Keyword" },
#     Label = { link = "Keyword" },
#     Operator = { fg = colors.on_surface_variant },
#     Exception = { fg = colors.error },
#     Type = { fg = colors.tertiary },
#     StorageClass = { link = "Type" },
#     Structure = { link = "Type" },
#     Typedef = { link = "Type" },
#     Special = { fg = colors.secondary },
#     SpecialChar = { link = "Special" },
#     Tag = { link = "Special" },
#     Delimiter = { fg = colors.on_surface_variant },
#     SpecialComment = { link = "Comment" },
#     Debug = { link = "Special" },
#     Tooltip = { fg = colors.on_surface, bg = colors.surface_container_high },
#     '
# # Treesitter groups
# ts_lines='    ["@attribute"] = { link = "PreProc" },
#     ["@boolean"] = { link = "Boolean" },
#     ["@character"] = { link = "Character" },
#     ["@character.special"] = { link = "Special" },
#     ["@comment"] = { link = "Comment" },
#     ["@conditional"] = { link = "Conditional" },
#     ["@constant"] = { link = "Constant" },
#     ["@constant.builtin"] = { link = "Constant" },
#     ["@constant.macro"] = { link = "Constant" },
#     ["@constructor"] = { fg = colors.tertiary },
#     ["@error"] = { fg = colors.error },
#     ["@exception"] = { link = "Exception" },
#     ["@field"] = { fg = colors.on_surface },
#     ["@float"] = { link = "Float" },
#     ["@function"] = { link = "Function" },
#     ["@function.builtin"] = { link = "Function" },
#     ["@function.macro"] = { link = "Function" },
#     ["@include"] = { link = "Include" },
#     ["@keyword"] = { link = "Keyword" },
#     ["@keyword.function"] = { fg = colors.primary },
#     ["@keyword.operator"] = { fg = colors.primary },
#     ["@keyword.return"] = { fg = colors.primary },
#     ["@label"] = { link = "Label" },
#     ["@method"] = { link = "Function" },
#     ["@namespace"] = { fg = colors.secondary },
#     ["@number"] = { link = "Number" },
#     ["@operator"] = { link = "Operator" },
#     ["@parameter"] = { fg = colors.color12 },
#     ["@property"] = { fg = colors.on_surface },
#     ["@punctuation"] = { fg = colors.on_surface_variant },
#     ["@punctuation.bracket"] = { fg = colors.on_surface_variant },
#     ["@punctuation.delimiter"] = { fg = colors.on_surface_variant },
#     ["@punctuation.special"] = { fg = colors.primary },
#     ["@repeat"] = { link = "Repeat" },
#     ["@string"] = { link = "String" },
#     ["@string.escape"] = { fg = colors.primary },
#     ["@string.regex"] = { link = "String" },
#     ["@string.special"] = { link = "Special" },
#     ["@symbol"] = { fg = colors.secondary },
#     ["@tag"] = { link = "Tag" },
#     ["@tag.delimiter"] = { fg = colors.primary },
#     ["@text"] = { fg = colors.on_surface },
#     ["@text.danger"] = { fg = colors.error, bg = colors.error_container },
#     ["@text.diff.add"] = { fg = colors.color10 },
#     ["@text.diff.delete"] = { fg = colors.color1 },
#     ["@text.emphasis"] = { italic = true },
#     ["@text.environment"] = { fg = colors.secondary },
#     ["@text.environment.name"] = { fg = colors.tertiary },
#     ["@text.literal"] = { link = "String" },
#     ["@text.math"] = { fg = colors.secondary },
#     ["@text.note"] = { fg = colors.on_surface, bg = colors.primary_container },
#     ["@text.note.warning"] = { fg = colors.on_surface, bg = colors.error_container },
#     ["@text.reference"] = { fg = colors.secondary },
#     ["@text.strike"] = { strikethrough = true },
#     ["@text.strong"] = { bold = true },
#     ["@text.title"] = { fg = colors.primary, bold = true },
#     ["@text.underline"] = { underline = true },
#     ["@text.uri"] = { fg = colors.secondary, underline = true },
#     ["@text.warning"] = { fg = colors.on_surface, bg = colors.error_container },
#     ["@todo"] = { fg = colors.on_surface, bg = colors.primary_container },
#     ["@type"] = { link = "Type" },
#     ["@type.builtin"] = { fg = colors.tertiary },
#     ["@type.definition"] = { fg = colors.tertiary },
#     ["@type.qualifier"] = { link = "Type" },
#     ["@variable"] = { fg = colors.on_surface },
#     ["@variable.builtin"] = { fg = colors.secondary },
#     '
#
# # LSP groups
# lsp_lines='    LspCodeLens = { fg = colors.on_surface_variant },
#     LspCodeLensSeparator = { fg = colors.on_surface_variant },
#     LspCompletionWord = { link = "Search" },
#     LspDiagnosticsDefaultError = { link = "Error" },
#     LspDiagnosticsDefaultHint = { link = "Hint" },
#     LspDiagnosticsDefaultInformation = { link = "Info" },
#     LspDiagnosticsDefaultWarning = { link = "Warning" },
#     LspDiagnosticsError = { fg = colors.error },
#     LspDiagnosticsErrorByteSize = { link = "LspDiagnosticsError" },
#     LspDiagnosticsFloatingError = { link = "ErrorFloat" },
#     LspDiagnosticsFloatingHint = { link = "HintFloat" },
#     LspDiagnosticsFloatingInformation = { link = "InfoFloat" },
#     LspDiagnosticsFloatingWarning = { link = "WarningFloat" },
#     LspDiagnosticsHint = { fg = colors.primary },
#     LspDiagnosticsInformation = { fg = colors.secondary },
#     LspDiagnosticsLineDefaultError = { link = "Error" },
#     LspDiagnosticsLineDefaultHint = { link = "Hint" },
#     LspDiagnosticsLineDefaultInformation = { link = "Info" },
#     LspDiagnosticsLineDefaultWarning = { link = "Warning" },
#     LspDiagnosticsSignDefaultError = { link = "LspDiagnosticsSignError" },
#     LspDiagnosticsSignDefaultHint = { link = "LspDiagnosticsSignHint" },
#     LspDiagnosticsSignDefaultInformation = { link = "LspDiagnosticsSignInformation" },
#     LspDiagnosticsSignDefaultWarning = { link = "LspDiagnosticsSignWarning" },
#     LspDiagnosticsSignError = { fg = colors.error },
#     LspDiagnosticsSignHint = { fg = colors.primary },
#     LspDiagnosticsSignInformation = { fg = colors.secondary },
#     LspDiagnosticsSignWarning = { fg = colors.color4 },
#     LspDiagnosticsUnderlineError = { undercurl = true, sp = colors.error },
#     LspDiagnosticsUnderlineHint = { undercurl = true, sp = colors.primary },
#     LspDiagnosticsUnderlineInformation = { undercurl = true, sp = colors.secondary },
#     LspDiagnosticsUnderlineWarning = { undercurl = true, sp = colors.color4 },
#     LspDiagnosticsVirtualTextDefaultError = { link = "LspDiagnosticsError" },
#     LspDiagnosticsVirtualTextDefaultHint = { link = "LspDiagnosticsHint" },
#     LspDiagnosticsVirtualTextDefaultInformation = { link = "LspDiagnosticsInformation" },
#     LspDiagnosticsVirtualTextDefaultWarning = { link = "LspDiagnosticsWarning" },
#     LspDiagnosticsVirtualTextError = { fg = colors.error },
#     LspDiagnosticsVirtualTextHint = { fg = colors.primary },
#     LspDiagnosticsVirtualTextInformation = { fg = colors.secondary },
#     LspDiagnosticsVirtualTextWarning = { fg = colors.color4 },
#     LspReferenceRead = { bg = colors.surface_container_high },
#     LspReferenceText = { bg = colors.surface_container_high },
#     LspReferenceWrite = { bg = colors.surface_container_high },
#     LspSignatureActiveParameter = { link = "Search" },
#     '
# # Diagnostic groups
# diag_lines='    DiagnosticDefaultError = { link = "Error" },
#     DiagnosticDefaultHint = { link = "Hint" },
#     DiagnosticDefaultInformation = { link = "Info" },
#     DiagnosticDefaultWarn = { link = "Warning" },
#     DiagnosticError = { link = "Error" },
#     DiagnosticFloatingError = { link = "ErrorFloat" },
#     DiagnosticFloatingHint = { link = "HintFloat" },
#     DiagnosticFloatingInformation = { link = "InfoFloat" },
#     DiagnosticFloatingWarn = { link = "WarningFloat" },
#     DiagnosticHint = { fg = colors.primary },
#     DiagnosticInformation = { fg = colors.secondary },
#     DiagnosticOk = { fg = colors.color10 },
#     DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
#     DiagnosticUnderlineHint = { undercurl = true, sp = colors.primary },
#     DiagnosticUnderlineInformation = { undercurl = true, sp = colors.secondary },
#     DiagnosticUnderlineOk = { undercurl = true, sp = colors.color10 },
#     DiagnosticUnderlineWarn = { undercurl = true, sp = colors.color4 },
#     DiagnosticUnnecessary = { fg = colors.on_surface_variant, underline = true },
#     DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
#     DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
#     DiagnosticVirtualTextInformation = { link = "LspDiagnosticsVirtualTextInformation" },
#     DiagnosticVirtualTextOk = { fg = colors.color10 },
#     DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
#     DiagnosticWarn = { fg = colors.color4 },
#     Error = { fg = colors.error },
#     ErrorFloat = { fg = colors.on_error, bg = colors.error },
#     Hint = { fg = colors.primary },
#     HintFloat = { fg = colors.on_primary, bg = colors.primary },
#     Info = { fg = colors.secondary },
#     InfoFloat = { fg = colors.on_secondary, bg = colors.secondary },
#     Warning = { fg = colors.color4 },
#     WarningFloat = { fg = colors.on_background, bg = colors.color4 },
#     '
# # Diff groups
# diff_lines='    diffAdded = { fg = colors.color10 },
#     diffChanged = { fg = colors.color4 },
#     diffDeleted = { fg = colors.color1 },
#     diffAddedDouble = { link = "diffAdded" },
#     diffAddedGutter = { link = "diffAdded" },
#     diffBase = { fg = colors.on_surface },
#     diffChangedGutter = { link = "diffChanged" },
#     diffCommon = { fg = colors.on_surface },
#     diffDeletedGutter = { link = "diffDeleted" },
#     diffDiffAdded = { link = "diffAdded" },
#     diffDiffDeleted = { link = "diffDeleted" },
#     diffFile = { fg = colors.primary },
#     diffFileName = { fg = colors.primary },
#     diffGutterAddedLine = { bg = colors.color10, blend = 20 },
#     diffGutterChangedLine = { bg = colors.color4, blend = 20 },
#     diffGutterDeletedLine = { bg = colors.color1, blend = 20 },
#     diffGutterUntracked = { fg = colors.on_surface_variant },
#     diffIdentifier = { fg = colors.primary, bold = true },
#     diffIndexLine = { fg = colors.on_surface_variant },
#     diffIndexLineDeleted = { link = "diffDeleted" },
#     diffIndexLineInserted = { link = "diffAdded" },
#     diffLine = { fg = colors.primary },
#     diffLineAdded = { link = "diffAdded" },
#     diffLineDeleted = { link = "diffDeleted" },
#     diffLocation = { fg = colors.primary },
#     diffNewFile = { fg = colors.color10 },
#     diffNoChanges = { fg = colors.on_surface },
#     diffOldFile = { fg = colors.color1 },
#     diffOnly = { fg = colors.primary },
#     diffRemoved = { link = "diffDeleted" },
#     diffResourceAdd = { link = "diffAdded" },
#     diffResourceChange = { link = "diffChanged" },
#     diffResourceDelete = { link = "diffDeleted" },
#     diffResourceHeader = { fg = colors.primary, bold = true },
#     diffResult = { fg = colors.on_surface },
#     diffStatAdd = { link = "diffAdded" },
#     diffStatChange = { link = "diffChanged" },
#     diffStatDelete = { link = "diffDeleted" },
#     diffSubtextNew = { fg = colors.color4 },
#     diffSubtextOld = { fg = colors.color1 },
#     diffUntracked = { fg = colors.color4 },
#     diffUntrackedFile = { fg = colors.color4 },
#     '
#
# # Create new file content
# cat > "$OUTPUT_FILE" << 'HEREDOC'
# local colors = {
# HEREDOC
# printf '%s' "$colors_lines" >> "$OUTPUT_FILE"
# printf '%s' "$base16_lines" >> "$OUTPUT_FILE"
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
# }
#
# local function hex_to_rgb(hex)
#     hex = hex:gsub("#", "")
#     return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
# end
#
# local function blend(bg, fg, alpha)
#     local br, bg_b, bb = hex_to_rgb(bg)
#     local fr, fg_f, fb = hex_to_rgb(fg)
#     local r = math.floor(br * (1 - alpha) + fr * alpha)
#     local g = math.floor(bg_b * (1 - alpha) + fg_f * alpha)
#     local b = math.floor(bb * (1 - alpha) + fb * alpha)
#     return string.format("#%02x%02x%02x", r, g, b)
# end
#
# local hl = vim.highlight
#
# local function set_hl(group, val)
#     if val.link then
#         hl.set(group, 0, { link = val.link })
#     else
#         local guisp = val.guisp
#         local sp = val.sp
#         val = vim.deepcopy(val)
#         val.guisp = nil
#         val.sp = nil
#         if sp then val.sp = blend(colors.surface, sp, 0.7) end
#         if guisp then val.guisp = blend(colors.surface, guisp, 0.7) end
#         hl.set(group, 0, val)
#     end
# end
#
# local theme = {
# HEREDOC
#
# # Write editor section
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     editor = {
# HEREDOC
# printf '%s' "$theme_lines" >> "$OUTPUT_FILE"
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     },
# HEREDOC
#
# # Write syntax section
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     syntax = {
# HEREDOC
# printf '%s' "$syntax_lines" >> "$OUTPUT_FILE"
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     },
# HEREDOC
#
# # Write treesitter section
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     treesitter = {
# HEREDOC
# printf '%s' "$ts_lines" >> "$OUTPUT_FILE"
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     },
# HEREDOC
#
# # Write lsp section
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     lsp = {
# HEREDOC
# printf '%s' "$lsp_lines" >> "$OUTPUT_FILE"
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     },
# HEREDOC
#
# # Write diagnostic section
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     diagnostics = {
# HEREDOC
# printf '%s' "$diag_lines" >> "$OUTPUT_FILE"
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     },
# HEREDOC
#
# # Write diff section
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     diff = {
# HEREDOC
# printf '%s' "$diff_lines" >> "$OUTPUT_FILE"
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     },
# HEREDOC
#
# # Write lualine section
# cat >> "$OUTPUT_FILE" << 'HEREDOC'
#     lualine = {
#         normal = {
#             a = { bg = colors.primary, fg = colors.on_primary },
#             b = { bg = colors.surface_container_high, fg = colors.on_surface },
#             c = { bg = colors.surface, fg = colors.on_surface },
#         },
#         insert = {
#             a = { bg = colors.tertiary, fg = colors.on_tertiary },
#             b = { bg = colors.surface_container_high, fg = colors.on_surface },
#             c = { bg = colors.surface, fg = colors.on_surface },
#         },
#         visual = {
#             a = { bg = colors.secondary, fg = colors.on_secondary },
#             b = { bg = colors.surface_container_high, fg = colors.on_surface },
#             c = { bg = colors.surface, fg = colors.on_surface },
#         },
#         command = {
#             a = { bg = colors.primary, fg = colors.on_primary },
#             b = { bg = colors.surface_container_high, fg = colors.on_surface },
#             c = { bg = colors.surface, fg = colors.on_surface },
#         },
#         replace = {
#             a = { bg = colors.error, fg = colors.on_error },
#             b = { bg = colors.surface_container_high, fg = colors.on_surface },
#             c = { bg = colors.surface, fg = colors.on_surface },
#         },
#         inactive = {
#             a = { bg = colors.surface_dim, fg = colors.on_surface_variant },
#             b = { bg = colors.surface_dim, fg = colors.on_surface_variant },
#             c = { bg = colors.surface, fg = colors.on_surface_variant },
#         },
#     },
# }
#
# return theme, set_hl
# HEREDOC
#
# echo "Generated $OUTPUT_FILE"
