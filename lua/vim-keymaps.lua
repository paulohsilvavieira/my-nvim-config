local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


keymap('n', '<C-s>', ':w<CR>', { silent = true })


keymap('n', '<C-w>', ':BufDel<CR>', { noremap = true, silent = true })


keymap('n', '<C-S-k>', ':m .+1<CR>==', { noremap = true, silent = true })
keymap('n', '<C-S-j>', ':m .-2<CR>==', { noremap = true, silent = true })

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)


keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
