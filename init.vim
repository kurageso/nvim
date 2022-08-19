
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
" nnoremap <leader>v <cmd>CHADopen<cr>
"==============================================================================

nnoremap <space>e <cmd>CocCommand explorer<CR>


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
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'  " Rubocopを非同期で実行
Plug 'tpope/vim-rails'     " Rails
Plug 'tpope/vim-endwise'   " endを自動でつける

Plug 'voldikss/vim-floaterm'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'rcarriga/nvim-notify'
Plug 'romgrk/barbar.nvim'
Plug 'glepnir/dashboard-nvim'
" colorscheme
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Yazeed1s/minimal.nvim'


Plug 'previm/previm'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'vim-test/vim-test'

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

let g:coc_global_extensions = ['coc-lists', 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-vetur', 'coc-explorer', 'coc-solargraph']

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



