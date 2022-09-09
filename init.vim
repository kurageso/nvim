
"==============================================================================
" 初期設定

" blackのインストール
" https://github.com/psf/black#installation
" `pip3 install black`

"==============================================================================


set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set backspace=indent,eol,start

let g:python3_host_prog = expand('/usr/local/bin/python3')

"==============================================================================
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'    " Rubocopを非同期で実行
Plug 'tpope/vim-rails'       " Rails
Plug 'tpope/vim-endwise'     " endを自動でつける
Plug 'vim-test/vim-test'     " testを実行する
Plug 'jiangmiao/auto-pairs'  " 自動で閉じ括弧を入力する
Plug 'voldikss/vim-floaterm' " ターミナルをフロートで表示

Plug 'nvim-lualine/lualine.nvim'    " line
Plug 'kyazdani42/nvim-web-devicons' " icon
Plug 'rcarriga/nvim-notify'         " 通知
Plug 'romgrk/barbar.nvim'           " bar
Plug 'glepnir/dashboard-nvim'       " 起動時にダッシュボードを表示する

Plug 'tpope/vim-dispatch'

Plug 'lukas-reineke/indent-blankline.nvim' " インデントをわかりやすくする

" colorscheme
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Yazeed1s/minimal.nvim'

Plug 'previm/previm'


Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'


" fuzzy finder
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

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
      \ ]

"==============================================================================

"==============================================================================
" ファイル保存時の処理
filetype plugin on
augroup setAutoCompile
    autocmd!
"    autocmd BufWritePost *.tex :!latexmk %:p
"    autocmd BufWritePost *.py :!black %:p
"    autocmd BufWritePost *.cpp :!g++ -std=c++14 %:p
     " autocmd BufWritePost *_spec.rb :TestFile %:p
"    autocmd BufWritePost *.vue :!yarn prettier --write %:p
augroup END


" テストファイルの保存時にテストを実行する
augroup test
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END



"==============================================================================


let g:test#strategy = 'dispatch'


lua << END
require("options")
require("keymaps")
END


