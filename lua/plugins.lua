local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'rgroli/other.nvim'

Plug 'sbdchd/neoformat'

Plug 'nvim-zh/colorful-winsep.nvim'

-- 余分な空白に色をつける
Plug 'ntpeters/vim-better-whitespace'

Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'

Plug 'kkoomen/vim-doge'
-- :call doge#install()

Plug 'folke/trouble.nvim'

Plug 'nvim-tree/nvim-tree.lua'

Plug 'rmagatti/auto-session'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug('glepnir/lspsaga.nvim', { branch = 'main' })
Plug 'j-hui/fidget.nvim'

Plug "SmiteshP/nvim-navic"

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

-- Plug 'tpope/vim-projectionist'

Plug 'tpope/vim-dispatch'

-- Plug('neoclide/coc.nvim', { branch = 'release'})

Plug 'liuchengxu/vista.vim'

Plug 'petertriho/nvim-scrollbar'

Plug 'stevearc/overseer.nvim'

Plug 'sidebar-nvim/sidebar.nvim'

Plug 'kevinhwang91/nvim-hlslens'

Plug 'unblevable/quick-scope'

-- gitでの変更履歴を表示
Plug 'APZelos/blamer.nvim'

Plug 'dense-analysis/ale'    -- Rubocopを非同期で実行
-- Plug 'tpope/vim-rails'       -- Rails
-- Plug 'tpope/vim-endwise'  -- endを自動でつける

-- test
Plug 'vim-test/vim-test'     -- testを実行する

Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'olimorris/neotest-rspec'
Plug 'haydenmeade/neotest-jest'
Plug 'nvim-neotest/neotest-plenary'
Plug 'nvim-neotest/neotest-go'

Plug 'voldikss/vim-floaterm' -- ターミナルをフロートで表示

-- 閉じ括弧などの自動入力
-- Plug 'jiangmiao/auto-pairs'  -- endwiseとの相性が悪かった
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'andymass/vim-matchup'     -- %での移動を強化する

Plug 'nvim-lualine/lualine.nvim'    -- line
Plug 'kyazdani42/nvim-web-devicons' -- icon
Plug 'rcarriga/nvim-notify'         -- 通知
Plug 'romgrk/barbar.nvim'           -- bar
Plug 'glepnir/dashboard-nvim'       -- 起動時にダッシュボードを表示する

-- コメント
-- https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
-- contextに応じたコメント
Plug 'JoosepAlviste/nvim-ts-context-commentstring'


-- 引数の変数の色を変える
Plug 'm-demare/hlargs.nvim'

-- 閉じ括弧の対応先を表示
Plug 'haringsrob/nvim_context_vt'

Plug 'lukas-reineke/indent-blankline.nvim' -- インデントをわかりやすくする

-- colorscheme
Plug 'navarasu/onedark.nvim'

Plug 'previm/previm'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'


-- fuzzy finder
-- Plug('junegunn/fzf', { dir = '~/.fzf', "do" = './install --all'})
Plug 'junegunn/fzf.vim' -- needed for previews
Plug('antoinemadec/coc-fzf', { branch = 'release'})

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug 'nvim-telescope/telescope-frecency.nvim'

Plug 'airblade/vim-gitgutter'


Plug 'tpope/vim-surround'

Plug 'mfussenegger/nvim-dap'
Plug 'suketa/nvim-dap-ruby'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'

Plug 'unblevable/quick-scope'

-- Plug('neoclide/coc.nvim', { branc = 'release'})

Plug 'liuchengxu/vista.vim'

Plug 'petertriho/nvim-scrollbar'

Plug 'stevearc/overseer.nvim'

Plug 'sidebar-nvim/sidebar.nvim'

Plug 'kevinhwang91/nvim-hlslens'

Plug 'unblevable/quick-scope'

-- gitでの変更履歴を表示
Plug 'APZelos/blamer.nvim'

Plug 'dense-analysis/ale'    -- Rubocopを非同期で実行
-- Plug 'tpope/vim-rails'       -- Rails
-- Plug 'tpope/vim-endwise'   -- endを自動でつける

-- test
Plug 'vim-test/vim-test'     -- testを実行する

Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'olimorris/neotest-rspec'
Plug 'haydenmeade/neotest-jest'
Plug 'nvim-neotest/neotest-plenary'


Plug 'voldikss/vim-floaterm' -- ターミナルをフロートで表示

-- 閉じ括弧などの自動入力
-- Plug 'jiangmiao/auto-pairs'  " endwiseとの相性が悪かった
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'andymass/vim-matchup'     -- %での移動を強化する

Plug 'nvim-lualine/lualine.nvim'    -- line
Plug 'kyazdani42/nvim-web-devicons' -- icon
Plug 'rcarriga/nvim-notify'         -- 通知
Plug 'romgrk/barbar.nvim'           -- bar
Plug 'glepnir/dashboard-nvim'       -- 起動時にダッシュボードを表示する

-- コメント
-- https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
-- contextに応じたコメント
Plug 'JoosepAlviste/nvim-ts-context-commentstring'


-- 引数の変数の色を変える
Plug 'm-demare/hlargs.nvim'

-- 閉じ括弧の対応先を表示
Plug 'haringsrob/nvim_context_vt'

Plug 'lukas-reineke/indent-blankline.nvim' -- インデントをわかりやすくする

-- colorscheme
Plug 'navarasu/onedark.nvim'

Plug 'previm/previm'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'


-- fuzzy finder
-- Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
-- Plug 'junegunn/fzf.vim' -- needed for previews
-- Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug 'nvim-telescope/telescope-frecency.nvim'

Plug 'airblade/vim-gitgutter'


Plug 'tpope/vim-surround'

Plug 'mfussenegger/nvim-dap'
Plug 'suketa/nvim-dap-ruby'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'

Plug 'unblevable/quick-scope'


vim.call('plug#end')
