vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.o.undodir = vim.fn.expand('~/.vim/undodir')

local undodir = vim.fn.expand(vim.o.undodir)
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end
