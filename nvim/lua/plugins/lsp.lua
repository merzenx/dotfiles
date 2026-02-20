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
      ensure_installed = { "rust_analyzer", "jsonls", "html", "cssls", "tailwindcss", "gopls", "tsgo", "marksman", "yamlls", "oxlint", "eslint", "emmet_ls", "svelte", "volar" },
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
      vim.lsp.enable('biome')
      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = {
              {
                fileMatch = { 'package.json' },
                url = 'https://json.schemastore.org/package',
              },
              {
                fileMatch = { 'biome.json' },
                url = './node_modules/@biomejs/biome/configuration_schema.json',
              },
            },
          },
        },
      })
      vim.lsp.enable('jsonls')
      vim.lsp.enable('html')
      vim.lsp.enable('cssls')
      vim.lsp.enable('tailwindcss')
      vim.lsp.enable('gopls')
      vim.lsp.enable('marksman')
      vim.lsp.enable('yamlls')
      vim.lsp.enable('oxlint')
      vim.lsp.enable('eslint')
      vim.lsp.enable('emmet_ls')
      vim.lsp.enable('svelte')
      vim.lsp.enable('volar')
    end,
  },
}
