local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  -- overriding default keymaps
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
end)

-- format on save
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
    ['pylsp'] = {'python'},
  }
})

-- language server setup
require('mason').setup({})
require('mason-lspconfig').setup({
  -- add servers here for mason to automatically add
  ensure_installed = {
	  'tsserver',
	  'rust_analyzer',
	  'pylsp',
	  'eslint'
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

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
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }),
  snippet = {
	expand = function (args)
		require('luasnip').lsp_expand(args.body)
	end,
  }
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})
