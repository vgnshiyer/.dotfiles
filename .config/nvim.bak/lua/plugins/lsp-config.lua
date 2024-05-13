return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "jsonls",
          "java_language_server",
          "jdtls",
          "tsserver",
          "quick_lint_js",
          "jedi_language_server",
          "rust_analyzer"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.java_language_server.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.quick_lint_js.setup({})
      lspconfig.jedi_language_server.setup({})
      lspconfig.rust_analyzer.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, {})
    end
  }
}
