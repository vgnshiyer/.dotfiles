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

require("tokyonight").setup({
  style = "night", -- night, storm, day
  transparent = true,
  italic_comments = true,
  italic_keywords = true,
  italic_functions = true,
  italic_variables = true,
  contrast = true,
  hide_inactive_statusline = true,
  dark_sidebar = true,
  dark_float = true,
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
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

    "tokyonight",
    "tokyonight-night",
    "tokyonight-storm",
    "tokyonight-day",
  },
  livePreview = true,
})

vim.keymap.set('n', '<leader>tt', ':Themery<CR>')

-- statusline
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_light',
  },
  extensions = {
    'nvim-tree'
  }
}
