-- Cmd + Shift + E : Switch focus (equivalent to vscode switch focus to file tree)
vim.keymap.set("n", "<F2>", "<C-w>w")

-- Cmd + f : search
vim.keymap.set("n", "<F6>", "/")

-- past without losing what you have on clipboard
vim.keymap.set("x", "<leader>p", "_dP")

-- normal ctrl + d/u, bring focus back to center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Select and drag lines in visual mode (equi to vscode alt + up/down)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "J", "mzJ`z")

-- copy to system clipboard
vim.keymap.set("n", "y", "\"+y")
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("n", "Y", "\"+Y")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- option + backspace (delete entire previous word)
vim.api.nvim_set_keymap('i', '<A-BS>', '<C-W>', { noremap = true, silent = true })

