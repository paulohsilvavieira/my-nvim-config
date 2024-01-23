local opts = { noremap = true, silent = true }


vim.keymap.set('n', '<C-s>', ':silent! w<CR>', { silent = true })


vim.keymap.set('n', '<C-w>', ':silent! BufDel<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<A-k>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ':m .-2<CR>==', { noremap = true, silent = true })



vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = true})


vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)


vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)


