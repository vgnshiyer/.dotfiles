return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["e"] = "open",
        }
      }
    })
		vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>', {})
	end
}
