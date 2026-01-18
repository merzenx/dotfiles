-- lua/plugins/lsp.lua

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_enable = true,
      ensure_installed = { "ts_ls", "rust_analyzer", "jsonls", "html", "cssls", "tailwindcss" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

          vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts) 

          vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, opts)

          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        end,
      })

      local servers = { "ts_ls", "rust_analyzer", "biome", "jsonls", "html", "cssls", "tailwindcss" }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          settings = {},
        })
        
        vim.lsp.enable(server)
      end
    end,
  },
}
