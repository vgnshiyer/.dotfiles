return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    filesystem = {
      window = {
        mappings = {
          ["."] = "toggle_hidden",
          ["e"] = "open",
        },
      },
    },
  },
}
