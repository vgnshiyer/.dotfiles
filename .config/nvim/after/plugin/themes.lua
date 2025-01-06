-- colorschemes
require('kanagawa').setup({
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  transparent = true,
  theme = "dragon",
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },

  vim.cmd 'highlight TelescopeBorder guibg=none',
  vim.cmd 'highlight TelescopeTitle guibg=none',
})

require("rose-pine").setup({
  variant = "main",
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  extend_background_behind_borders = true,
  enable = {
    terminal = true,
    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    migrations = true, -- Handle deprecated options automatically
  },

  styles = {
    bold = true,
    italic = true,
    transparency = true,
  },
})

-- theme switcher
require("themery").setup({
  themes = {
    "rose-pine",
    "rose-pine-dawn",
    "rose-pine-moon",
    "rose-pine-main",

    "kanagawa",
    "kanagawa-dragon",
    "kanagawa-lotus",
    "kanagawa-wave",
  },
  livePreview = true,
})

vim.keymap.set('n', '<leader>tt', ':Themery<CR>')

-- statusline
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
  },
  extensions = {
    'nvim-tree'
  }
}
