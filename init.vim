
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
"==============================================================================
" CHAD
" \vでCHADを開く
nnoremap <leader>v <cmd>CHADopen<cr>
"==============================================================================



"==============================================================================
" other
" スペースキー2回で保存する
noremap <space><space> :<C-U>w<CR>


" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"==============================================================================



"==============================================================================
call plug#begin()
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'  " Rubocopを非同期で実行
Plug 'tpope/vim-rails'     " Rails
Plug 'tpope/vim-endwise'   " endを自動でつける

Plug 'voldikss/vim-floaterm'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
"==============================================================================


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

augroup vimrc_floaterm
  autocmd!
  autocmd QuitPre * FloatermKill!
augroup END
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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"==============================================================================

"==============================================================================
" ファイル保存時の処理
filetype plugin on
augroup setAutoCompile
    autocmd!
    autocmd BufWritePost *.tex :!latexmk %:p
    autocmd BufWritePost *.py :!black %:p
    autocmd BufWritePost *.cpp :!g++ -std=c++14 %:p
    autocmd BufWritePost *.rb :!rubocop -a %:p
augroup END
"==============================================================================


lua << END
require('lualine').setup()
END


colorscheme tokyonight

