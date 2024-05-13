return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {"java", "lua", "rust", "javascript", "typescript", "python"},
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
