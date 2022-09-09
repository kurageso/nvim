local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "9", "$", opts)


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
keymap("n", "<leader>f", ":Telescope find_files<CR>",  opts)
keymap("n", "fg",        ":Telescope find_string<CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep<CR>",   opts)

-- coc
keymap("n", "<leader>f", ":CocList files<CR>", opts)


-- vim-floaterm
keymap("n", "tn",            ":FloatermNew<CR>",    opts)
keymap("t", "tn", "<C-\\><C-n>:FloatermNew<CR>",    opts)
keymap("n", "[",             ":FloatermPrev<CR>",   opts)
keymap("t", "[",  "<C-\\><C-n>:FloatermPrev<CR>",   opts)
keymap("n", "]",             ":FloatermNext<CR>",   opts)
keymap("t", "]",  "<C-\\><C-n>:FloatermNext<CR>",   opts)
keymap("n", "tt",            ":FloatermToggle<CR>", opts)
keymap("t", "tt", "<C-\\><C-n>:FloatermToggle<CR>", opts)

keymap("n", "tg",            ":FloatermNew lazygit<CR>", opts)
keymap("i", "tg", "<C-\\><C-n>:FloatermNew lazygit<CR>", opts)

