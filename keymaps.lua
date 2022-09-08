local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<space>e", ":CocCommand explorer<CR>", opts)

keymap("n", "<C-,>", ":BufferPrevious<CR>", opts)
keymap("n", "<C-.>", ":BufferNext<CR>",     opts)


-- スペースキー2回で保存する
keymap("n", "<space><space>", ":<C-U>w<CR>", opts)

-- 入力モードでのカーソル移動
keymap("i", "<C-j>", "<Down>",  opts)
keymap("i", "<C-k>", "<Up>",    opts)
keymap("i", "<C-h>", "<Left>",  opts)
keymap("i", "<C-l>", "<Right>", opts)

-- barbar
keymap("n", ",", ":BufferPrevious<CR>", opts)
keymap("n", ".", ":BufferNext<CR>",     opts)

-- telescope
keymap("n", "ff", ":Telescope find_files<CR>",  opts)
keymap("n", "fg", ":Telescope find_string<CR>", opts)



