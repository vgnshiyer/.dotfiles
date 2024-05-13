-- keymap. are automatically loaded on the VeryLazy event
-- Default keymap. that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymap..lua
-- Add any additional keymap. here

-- line numbers
vim.keymap.set("n", "<leader>l", "<cmd>set number!<cr>", { desc = "Toggle line number" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- buffer
vim.keymap.set(
  "n",
  "<leader>bb",
  "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
  { desc = "Telescope buffers" }
)

vim.keymap.set("v", "C-s", "<cmd>sort<cr>") -- Sort highlighted text in visual mode with Control + s
vim.keymap.set("v", "<leader>rr", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv") -- Move current line down
vim.keymap.set("v", "<M-UP>", ":m '>-2<CR>gv=gv") -- Move current line up
