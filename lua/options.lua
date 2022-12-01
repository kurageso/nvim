-- vim.opt
vim.opt.mouse = "a"   -- マウスで操作可能にする
vim.opt.number = true -- 行番号を表示
vim.opt.autoindent = true -- 改行時に自動でインデントする

vim.opt.laststatus = 3

vim.opt.tabstop = 2          -- タブを何文字の空白に変換するか
vim.opt.shiftwidth = 2       -- 自動インデント時に入力する空白の数
vim.opt.expandtab = true          -- タブ入力を空白に変換
vim.opt.splitright = true         -- 画面を縦分割する際に右に開く
vim.opt.clipboard = "unnamed"  -- yank した文字列をクリップボードにコピー
vim.opt.hls = true                -- 検索した文字をハイライトする
vim.opt.backspace = "indent,eol,start"
vim.opt.cmdheight = 0
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"
vim.opt.cursorline = true
vim.opt.helplang = "ja"

vim.g.blamer_enabled = 1
vim.g.previm_open_cmd = "open -a Google Chrome"
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}

require("hlslens").setup({
   build_position_cb = function(plist, _, _, _)
        require("scrollbar.handlers.search").handler.show(plist.start_pos)
   end,
})

require('lualine').setup({
  options = {
    globalstatus = true,
  }
})

require('trouble').setup()

-- require('colorful-winsep').setup({})
-- <C-w><C-w>で最初のbufに戻れなくなるのでコメントアウト
require("noice").setup({
  cmdline = {
    format = {
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    }
  },
  messages = {
    enabled = false
  }
})

require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", "vendor/ruby" }} }

require('hlargs').setup()

require("todo-comments").setup()

require("scrollbar").setup()

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

require('colorizer').setup { '*' }

require("sidebar-nvim").setup {
  open = false,
  sections = { 'datetime', 'git' }
}

require("overseer").setup()

vim.notify = require("notify")

require"fidget".setup{}


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Project", "/"},
}

vim.cmd([[
  let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'python': ['black'],
      \ 'ruby': ['rubocop'],
      \ 'go': ['gofmt'],
      \ }
  let g:ale_fix_on_save = 1
]])


-- lspもjsとして認識してしまうのでコメントアウト
-- vim.g.doge_filetype_aliases = {
--   javascript =  { 'vue' }
-- }
