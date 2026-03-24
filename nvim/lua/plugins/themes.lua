local theme = require('config.theme')
--
-- vim.cmd('hi clear')
-- if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
-- vim.o.background = 'dark'
-- vim.o.termguicolors = true
--
-- for section, groups in pairs(theme) do
--     if section ~= 'lualine' then
--         for name, opts in pairs(groups) do
--             vim.api.nvim_set_hl(0, name, opts)
--         end
--     end
-- end
--
return {
    {
      "nvim-lualine/lualine.nvim",
       dependencies = {
           "nvim-tree/nvim-web-devicons",
       },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'dank16',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                },
            })
         end
   }
}
