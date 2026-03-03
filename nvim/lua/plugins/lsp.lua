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
      ensure_installed = { 
        "rust_analyzer", "jsonls", "html", "cssls", "tailwindcss", 
        "tsgo", "marksman", "yamlls", "oxlint", 
        "eslint", "emmet_ls", "svelte", "taplo", "biome"
      },
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

      vim.lsp.enable('tsgo')
      vim.lsp.enable('rust_analyzer')

      vim.lsp.config('jsonls', {
        settings = {
          json = {
            validate = { enable = true },
            schemas = {
              {
                fileMatch = { 'package.json' },
                url = 'https://json.schemastore.org/package',
              },
            },
          },
        },
      })
      vim.lsp.enable('jsonls')

      local other_servers = {
        'html', 'cssls', 'tailwindcss', 'gopls', 
        'marksman', 'yamlls', 'oxlint', 'eslint', 
        'emmet_ls', 'svelte', 'taplo', "biome"
      }
      for _, lsp in ipairs(other_servers) do
        vim.lsp.enable(lsp)
      end
    end,
  },
}
