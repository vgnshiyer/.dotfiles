vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- plugin manager
  use 'wbthomason/packer.nvim'

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- colorschemes
  use { "rebelot/kanagawa.nvim", name = "kanagawa" }
  use { 'rose-pine/neovim', name = 'rose-pine' }
  use { 'folke/tokyonight.nvim', name = 'tokyonight' }
  use 'zaldih/themery.nvim' -- theme switcher

  -- syntax highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' }
    }
  }
  use { 'nvim-lua/lsp-status.nvim' }

  -- file explorer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    }
  }
  -- use {
  --   'akinsho/bufferline.nvim',
  --   branch = 'main',
  --   dependencies = { 'kyazdani42/nvim-web-devicons' },
  --   config = function()
  --     require('bufferline').setup({
  --       options = {
  --         offsets = {
  --           {
  --             filetype = "neo-tree",
  --             text = "File Explorer",
  --             highlight = "Directory",
  --             text_align = "left"
  --           }
  --         }
  --       }
  --     })
  --   end,
  -- }

  -- commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      -- retain vscode shortcuts (Cmd + /)
      vim.api.nvim_set_keymap('n', '<F19>', 'gcc', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('v', '<F19>', 'gc', { noremap = false, silent = true })
    end
  }

  -- visual
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- autoclose brackets
  use {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup()
    end
  }

  -- surround text
  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  })

  -- indentations
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup {
        indent = { char = "┊" },
        scope = { enabled = false },
        exclude = {
          buftypes = { "terminal", "nofile" },
          filetypes = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
          },
        },
      }
    end
  }

  -- menu
  use {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local logo = [[
        ██╗   ██╗ ██████╗ ███╗   ██╗███████╗██╗  ██╗██╗██╗   ██╗███████╗██████╗    
        ██║   ██║██╔════╝ ████╗  ██║██╔════╝██║  ██║██║╚██╗ ██╔╝██╔════╝██╔══██╗   
        ██║   ██║██║  ███╗██╔██╗ ██║███████╗███████║██║ ╚████╔╝ █████╗  ██████╔╝   
        ╚██╗ ██╔╝██║   ██║██║╚██╗██║╚════██║██╔══██║██║  ╚██╔╝  ██╔══╝  ██╔══██╗   
         ╚████╔╝ ╚██████╔╝██║ ╚████║███████║██║  ██║██║   ██║   ███████╗██║  ██║██╗
          ╚═══╝   ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝
      ]]
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          shortcut = {
            { desc = '[  @vgnshiyer]', group = 'DashboardShortCut' },
            { desc = '[🌐  blog.vgnshiyer.dev]', group = 'DashboardShortCut' },
          },
          packages = { enable = false },
          header = vim.split(logo, "\n"),
          project = { limit = 6 },
          footer = {}
        }
      }
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#FFBD38", bold = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#FFBD38", bold = true })
        end,
      })
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  -- cmdline
  use {
    'folke/noice.nvim',
    event = "VimEnter",
    config = function ()
      require('noice').setup({
        notify = { enabled = false },
        lsp = {
          progress = { enabled = false },
        },
        messages = { enabled = false },
        cmdline = {
          enabled = true,
          format = {
            cmdline = { pattern = "^:", icon = ">_", lang = "vim" },
          }
        },
        popupmenu = { enabled = true },
        presets = {
          bottom_search = true,
        },
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
    }
  }

  -- copilot
  use {
    "robitx/gp.nvim",
    -- chats are stored here: ~/.local/share/nvim/gp/chats 
    requires = {
      { 'github/copilot.vim' }
    }
  }

  -- git
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
end)

