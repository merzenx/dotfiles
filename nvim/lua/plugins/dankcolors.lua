return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#141617',
				base01 = '#141617',
				base02 = '#7a7c73',
				base03 = '#7a7c73',
				base04 = '#bdbfb3',
				base05 = '#fdfff8',
				base06 = '#fdfff8',
				base07 = '#fdfff8',
				base08 = '#f5a699',
				base09 = '#f5a699',
				base0A = '#bbc87c',
				base0B = '#95da8d',
				base0C = '#f5fecb',
				base0D = '#bbc87c',
				base0E = '#dfeca2',
				base0F = '#dfeca2',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#7a7c73',
				fg = '#fdfff8',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#bbc87c',
				fg = '#141617',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7a7c73' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#f5fecb', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#dfeca2',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#bbc87c',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#bbc87c',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#f5fecb',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#95da8d',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#bdbfb3' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#bdbfb3' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#7a7c73',
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
