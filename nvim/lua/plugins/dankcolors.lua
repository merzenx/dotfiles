return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#10140f',
				base01 = '#10140f',
				base02 = '#717b71',
				base03 = '#717b71',
				base04 = '#abb7ab',
				base05 = '#f6fdf6',
				base06 = '#f6fdf6',
				base07 = '#f6fdf6',
				base08 = '#eca088',
				base09 = '#eca088',
				base0A = '#63c067',
				base0B = '#80d27e',
				base0C = '#b6f4b9',
				base0D = '#63c067',
				base0E = '#89e38d',
				base0F = '#89e38d',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#717b71',
				fg = '#f6fdf6',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#63c067',
				fg = '#10140f',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#717b71' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#b6f4b9', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#89e38d',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#63c067',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#63c067',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#b6f4b9',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#80d27e',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#abb7ab' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#abb7ab' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#717b71',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
