local builtin = require('telescope.builtin')
vim.keymap.set('n', '<F4>', builtin.find_files, {})
vim.keymap.set('n', '<F5>', builtin.live_grep, {})

require('telescope').setup{
    defaults = {
        winblend = 0,
    }
}
