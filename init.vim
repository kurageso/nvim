
"==============================================================================
" 初期設定

" blackのインストール
" https://github.com/psf/black#installation
" `pip3 install black`

"==============================================================================


let g:python3_host_prog = expand('/usr/local/bin/python3')


set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set backspace=indent,eol,start
set mouse+=a
"==============================================================================
" CHAD
" \vでCHADを開く
" nnoremap <leader>v <cmd>CHADopen<cr>
"==============================================================================

nnoremap <space>e <cmd>CocCommand explorer<CR>

nnoremap <silent>    <C-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-.> <Cmd>BufferNext<CR>

"==============================================================================
" other
" スペースキー2回で保存する
noremap <space><space> :<C-U>w<CR>


" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap <S-w> k
nnoremap <S-a> h
nnoremap <S-s> j
nnoremap <S-d> l

"==============================================================================



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
" vim-floaterm
nnoremap <silent> <leader>tn           :FloatermNew<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>[            :FloatermPrev<CR>
tnoremap <silent> <leader>[  <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>]            :FloatermNext<CR>
tnoremap <silent> <leader>]  <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>tt           :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <leader>td <C-\><C-n>:FloatermKill!<CR>
nnoremap <silent> <leader>tg           :FloatermNew lazygit<CR>

augroup vimrc_floaterm
  autocmd!
  autocmd QuitPre * FloatermKill!
augroup END
"==============================================================================


"==============================================================================
" coc-fzf
nnoremap <silent> ff :CocFzfList files<CR>

"==============================================================================

"==============================================================================
" barbar
nnoremap <silent>    <silent>, :BufferPrevious<CR>
nnoremap <silent>    <silent>. :BufferNext<CR>


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
nnoremap <silent> <leader>f <Cmd>CocList files<CR>

let g:coc_global_extensions = ['coc-lists', 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-vetur', 'coc-pyls', 'coc-explorer', 'coc-solargraph']

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

lua << END
require('lualine').setup()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  ensure_installed = { "python", "javascript", "typescript", "vue", "ruby" }
}

require('treesitter-context').setup {
  enable = true,
  default = {
    patterns = { "class", "def", "function" }
  }
}

require('onedark').setup {
    style = 'dark'
}
require('onedark').load()

vim.notify = require("notify")


  local home = os.getenv('HOME')
  local db = require('dashboard')


  db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'CocList files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Open ~/.config/nvim/init.vim            ',
      action = ':tabe ~/.config/nvim/init.vim',
      shortcut = 'SPC f d'},
    }
END


let g:test#strategy = 'dispatch'
