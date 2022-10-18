-- M: option
-- C: Ctrl

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("i", "jj", "<ESC>", opts)

keymap("n", "<S-w>", "<C-w><C-w>", opts)

keymap("n", "<space>e", ":NvimTreeToggle<CR>",   opts)
keymap("n", "<space>f", ":NvimTreeFindFile<CR>", opts)

keymap("n", "<leader>oo", ":OtherClear<CR>:Other<CR>",       opts)
keymap("n", "<leader>os", ":OtherClear<CR>:OtherSplit<CR>",  opts)
keymap("n", "<leader>ov", ":OtherClear<CR>:OtherVSplit<CR>", opts)


-- barbar
keymap("n", "<leader>[", ":BufferPrevious<CR>", opts)
keymap("n", "<leader>]", ":BufferNext<CR>",     opts)
keymap("n", "<leader>x", ":BufferClose<CR>",    opts)


-- コメントアウト
keymap("n", "<C-/>", ":Commentary<CR>", opts)

-- スペースキー2回で保存する
keymap("n", "<space><space>", ":<C-U>w<CR>", opts)


-- telescope
keymap("n", "<leader>f", ":Telescope find_files<CR>",  opts)
keymap("n", "<leader>g", ":Telescope live_grep<CR>",   opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>",     opts)
keymap("n", "<leader>k", ":Telescope keymaps<CR>",     opts)
keymap("n", "<leader>j", ":Telescope jumplist<CR>",    opts)

-- vista
keymap("n", "<leader>vf", ":Vista finder nvim_lsp<CR>",   opts)

-- vim-floaterm
keymap("n", "<leader>tn",            ":FloatermNew<CR>",    opts)
keymap("t", "<leader>tn", "<C-\\><C-n>:FloatermNew<CR>",    opts)
keymap("n", "<leader>t[",             ":FloatermPrev<CR>",   opts)
keymap("t", "<leader>t[",  "<C-\\><C-n>:FloatermPrev<CR>",   opts)
keymap("n", "<leader>t]",             ":FloatermNext<CR>",   opts)
keymap("t", "<leader>t]",  "<C-\\><C-n>:FloatermNext<CR>",   opts)
keymap("n", "<leader>tt",            ":FloatermToggle<CR>", opts)
keymap("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", opts)

keymap("n", "<leader>tg",            ":FloatermNew lazygit<CR>", opts)
keymap("i", "<leader>tg", "<C-\\><C-n>:FloatermNew lazygit<CR>", opts)

keymap("n", "<C-a>", ":lua require('neotest').summary.toggle()<CR>", opts)
keymap("n", "<S-o>", ":lua require('neotest').output.open()<CR>", opts)

keymap("n", "<C-s>", ":Vista coc", opts)


-- 矢印キーを無効にする
keymap("n", "<Up>",    "<Nop>", opts)
keymap("n", "<Down>",  "<Nop>", opts)
keymap("n", "<Left>",  "<Nop>", opts)
keymap("n", "<Right>", "<nop>", opts)


-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- keymap("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
-- keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
-- keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)



-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
