local builtin = require('telescope.builtin')

-- equivalent to vscode Cmd + p (Open files in project)
vim.keymap.set('n', '<F4>', function()
  builtin.find_files({
    find_command = {'rg', '--files', '--hidden', '-g', '!.git'}
  })
end, {})

-- equivalent to vscode Cmd + shift + F (Global text search)
vim.keymap.set('n', '<F5>', builtin.live_grep, {})

require('telescope').setup{
  pickers = {
    oldfiles = {
      theme = 'ivy',
    },
    buffers = {
      sort_lastused = true,
      sort_mru = true,
      initial_mode = 'normal',
    },
  },
}
