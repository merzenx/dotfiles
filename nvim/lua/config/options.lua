-- OPTIONS
local set = vim.opt

--line nums
set.relativenumber = true
set.number = true

--encoding
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

--editor
set.guifont = "JetBrainsMonoNerdFontMono:h10"

-- indentation and tabs
set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true

-- search settings
set.ignorecase = true
set.smartcase = true

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"
set.fillchars:append({ eob = " " })

-- cursor line
set.cursorline = true

-- 80th column
-- set.colorcolumn = "80"

-- clipboard
set.clipboard:append("unnamedplus")

-- backspace
set.backspace = "indent,eol,start"

-- split windows
set.splitbelow = true
set.splitright = true

-- dw/diw/ciw works on full-word
set.iskeyword:append("-")

-- keep cursor at least 8 rows from top/bot
set.scrolloff = 8

-- incremental search
set.incsearch = true

-- faster cursor hold
set.updatetime = 50
