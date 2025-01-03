vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<CR>', { noremap = true })

require('gitsigns').setup({
  on_attach = function (bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = true })
    map('n', '[c', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = true })
    map('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line({full=true})<CR>', { noremap = true })
  end
})

-- git graph
-- local function open_git_log_graph()
--   vim.cmd('tabnew')
--   vim.cmd('terminal git log --oneline --graph --decorate --all')
--   vim.cmd('startinsert')
-- end
--
-- vim.keymap.set("n", "<leader>lg", open_git_log_graph)
