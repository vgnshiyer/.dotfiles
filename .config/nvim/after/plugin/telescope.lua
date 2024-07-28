local builtin = require('telescope.builtin')

vim.keymap.set('n', '<F4>', function()
  builtin.find_files({
    find_command = {'rg', '--files', '--hidden', '-g', '!.git'}
  })
end, {})
vim.keymap.set('n', '<F5>', builtin.live_grep, {})

require('telescope').setup{
    defaults = {
    }
}
