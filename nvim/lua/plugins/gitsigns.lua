-- lua/plugins/gitsigns.lua

return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local icons = require('config.icon')
    require('gitsigns').setup({
      signs = {
        add          = { text = icons.git.add },
        change       = { text = icons.git.change },
        delete       = { text = icons.git.delete },
        topdelete    = { text = icons.git.topdelete },
        changedelete = { text = icons.git.changedelete },
        untracked    = { text = icons.git.untracked },
      },

      on_attach = function(bufnr)
        local gs = require('gitsigns')

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map('n', ']c', function() 
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<cmd>echo "Next Hunk"<CR>'
        end, "Jump to Next Hunk")
        
        map('n', '[c', function() 
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<cmd>echo "Prev Hunk"<CR>'
        end, "Jump to Previous Hunk")

        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', "Stage current Hunk")
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', "Reset current Hunk")
        map('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', "Preview Hunk")
        map('n', '<leader>bl', gs.blame_line, "Blame Line")

        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', "Select Hunk")
      end
    })
  end,
}
