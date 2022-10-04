
"==============================================================================
" 初期設定

" blackのインストール
" https://github.com/psf/black#installation
" `pip3 install black`

"==============================================================================

autocmd BufWritePost  ~/.config/nvim/init.vim  source ~/.config/nvim/init.vim

set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set backspace=indent,eol,start
set cmdheight=2   
set whichwrap=b,s,h,l,<,>,[,],~
set cursorline
set helplang=ja

set encoding=utf-8
scriptencoding utf-8

let g:test#strategy = 'dispatch'
let g:python3_host_prog = expand('/usr/local/bin/python3')


let g:blamer_enabled = 1

"==============================================================================
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'liuchengxu/vista.vim'

Plug 'petertriho/nvim-scrollbar'

Plug 'stevearc/overseer.nvim'

Plug 'sidebar-nvim/sidebar.nvim'

Plug 'kevinhwang91/nvim-hlslens'

Plug 'unblevable/quick-scope'

" gitでの変更履歴を表示
Plug 'APZelos/blamer.nvim'

Plug 'dense-analysis/ale'    " Rubocopを非同期で実行
Plug 'tpope/vim-rails'       " Rails
" Plug 'tpope/vim-endwise'     " endを自動でつける

" test
Plug 'vim-test/vim-test'     " testを実行する

Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'olimorris/neotest-rspec'
Plug 'haydenmeade/neotest-jest'
Plug 'nvim-neotest/neotest-plenary'


Plug 'voldikss/vim-floaterm' " ターミナルをフロートで表示

" 閉じ括弧などの自動入力
" Plug 'jiangmiao/auto-pairs'  " endwiseとの相性が悪かった
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'andymass/vim-matchup'     " %での移動を強化する

Plug 'nvim-lualine/lualine.nvim'    " line
Plug 'kyazdani42/nvim-web-devicons' " icon
Plug 'rcarriga/nvim-notify'         " 通知
Plug 'romgrk/barbar.nvim'           " bar
Plug 'glepnir/dashboard-nvim'       " 起動時にダッシュボードを表示する

Plug 'tpope/vim-dispatch'

" コメント
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
" contextに応じたコメント
Plug 'JoosepAlviste/nvim-ts-context-commentstring'


" 引数の変数の色を変える
Plug 'm-demare/hlargs.nvim'

" 閉じ括弧の対応先を表示
Plug 'haringsrob/nvim_context_vt'

Plug 'lukas-reineke/indent-blankline.nvim' " インデントをわかりやすくする

" colorscheme
Plug 'navarasu/onedark.nvim'

Plug 'previm/previm'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'


" fuzzy finder
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-frecency.nvim'

Plug 'airblade/vim-gitgutter'


Plug 'tpope/vim-surround'

Plug 'mfussenegger/nvim-dap'
Plug 'suketa/nvim-dap-ruby'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'

Plug 'unblevable/quick-scope' 

call plug#end()

"==============================================================================


let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'python': ['black'],
      \ 'ruby': ['rubocop'],
      \ }
let g:ale_fix_on_save = 1

"==============================================================================
augroup vimrc_floaterm
  autocmd!
  autocmd QuitPre * FloatermKill!
augroup END
"==============================================================================


"==============================================================================
" previm
 let g:previm_open_cmd = 'open -a Google\ Chrome'
"==============================================================================

"==============================================================================
" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <silent> <leader>rf <Plug>(coc-references)
nnoremap <silent> <leader>h :<C-u>call CocAction('doHover')<CR>

let g:coc_global_extensions = [
      \ 'coc-lists',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-vetur',
      \ 'coc-pyls',
      \ 'coc-explorer',
      \ 'coc-solargraph',
      \ 'coc-snippets',
      \ 'coc-spell-checker',
      \ ]

"==============================================================================

"==============================================================================
" ファイル保存時の処理
filetype plugin on
augroup setAutoCompile
    autocmd!
"    autocmd BufWritePost *.py :!black %:p
"    autocmd BufWritePost *.cpp :!g++ -std=c++14 %:p
     autocmd BufWritePost *_spec.rb :lua require('neotest').run.run(vim.fn.expand('%'))
     autocmd BufWritePost *.spec.ts :lua require('neotest').run.run(vim.fn.expand('%'))
     "    autocmd BufWritePost *.vue :!yarn prettier --write %:p
     autocmd BufWritePost *_spec.rb :lua require('neotest').summary.open()

     autocmd BufWritePost *.spec.ts :lua require('neotest').summary.open()
     "    autocmd BufWritePost *.vue :!yarn prettier --write %:p
augroup END


"==============================================================================


lua << END
require("options")
require("keymaps")
require("config/neotest")
require("config/nvim-autopairs")
require("config/nvim-treesitter")
require("config/dap")

require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", "vendor/ruby" }} }

require('hlargs').setup()

require("todo-comments").setup()

require("scrollbar").setup()

require('colorizer').setup { '*' }

require("hlslens").setup({
   build_position_cb = function(plist, _, _, _)
        require("scrollbar.handlers.search").handler.show(plist.start_pos)
   end,
})

vim.cmd([[
    augroup scrollbar_search_hide
        autocmd!
        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
    augroup END
]])

require("sidebar-nvim").setup {
  open = false,
  sections = { 'datetime', 'git' }
}

require("overseer").setup()

END

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]


set nocompatible
filetype plugin on
runtime macros/matchit.vim

