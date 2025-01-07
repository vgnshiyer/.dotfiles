local lsp_zero = require('lsp-zero')

-- Fix Undefined global 'vim'
lsp_zero.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
end)

-- format on save
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['ts_ls'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
    ['pylsp'] = {'python'},
  }
})

-- language server setup
require('mason').setup({})
require('mason-lspconfig').setup({
  -- add servers here for mason to automatically add
  ensure_installed = {
      'typescript-language-server',
      'python-lsp-server',
	  'rust_analyzer',
      'lua_ls',
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
    pylsp = function ()
      require('lspconfig').pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { maxLineLength = 120 }
            }
          }
        }
      })
    end,
  },
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require("luasnip")

-- Extend snippets for specific filetypes
luasnip.filetype_extend("javascript", {"html"})
luasnip.filetype_extend("typescriptreact", {"html"})
luasnip.filetype_extend("python", {"django"})

-- autocompletion
local cmp = require('cmp')

cmp.setup({
  -- snippets 
  sources = {
	{name = 'nvim_lsp'},
	{name = 'luasnip'},
  },
  -- custom mappings
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  }),
  snippet = {
	expand = function (args)
	  require('luasnip').lsp_expand(args.body)
	end,
  }
})

vim.diagnostic.config({
  virtual_text = false,
})

vim.o.updatetime = 250
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { noremap = true, silent = true, desc = "Show diagnostics" })

