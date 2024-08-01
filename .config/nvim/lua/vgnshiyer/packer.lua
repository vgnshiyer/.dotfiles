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

    -- colorscheme
    use "rebelot/kanagawa.nvim"

    -- syntax highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('mbbill/undotree')

    -- language server
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'saadparwaiz1/cmp_luasnip' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

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

    use 'github/copilot.vim'

    -- commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
            -- Set key mappings for Comment.nvim
            vim.api.nvim_set_keymap('n', '<F19>', 'gcc', { noremap = false, silent = true })
            vim.api.nvim_set_keymap('v', '<F19>', 'gc', { noremap = false, silent = true })
        end
    }

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
end)

