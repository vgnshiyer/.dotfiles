require("themery").setup({
  themes = {
    "rose-pine",
    "rose-pine-dawn",
    "rose-pine-moon",
    "rose-pine-main",

    "kanagawa",
    "kanagawa-dragon",
    "kanagawa-lotus",
    "kanagawa-wave"
  },
  livePreview = true,
})

vim.keymap.set('n', '<leader>tt', ':Themery<CR>')
