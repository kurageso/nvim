-- vim.opt
vim.opt.mouse = "a"   -- マウスで操作可能にする
vim.opt.number = true -- 行番号を表示
vim.opt.autoindent = true -- 改行時に自動でインデントする

vim.opt.tabstop = 2          -- タブを何文字の空白に変換するか
vim.opt.shiftwidth = 2       -- 自動インデント時に入力する空白の数
vim.opt.expandtab = true          -- タブ入力を空白に変換
vim.opt.splitright = true         -- 画面を縦分割する際に右に開く
vim.opt.clipboard = "unnamed"  -- yank した文字列をクリップボードにコピー
vim.opt.hls = true                -- 検索した文字をハイライトする
vim.opt.backspace = "indent,eol,start"
vim.opt.cmdheight = 2
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"
vim.opt.cursorline = true
vim.opt.helplang = "ja"

vim.g.blamer_enabled = 1
vim.g.previm_open_cmd = "open -a Google Chrome"
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

require("hlslens").setup({
   build_position_cb = function(plist, _, _, _)
        require("scrollbar.handlers.search").handler.show(plist.start_pos)
   end,
})

require('lualine').setup()

require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", "vendor/ruby" }} }

require('hlargs').setup()

require("todo-comments").setup()

require("scrollbar").setup()

require('colorizer').setup { '*' }
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "ruby", "javascript", "lua", "typescript", "vue", "jsdoc", "html", "yaml", "vim", "vue", "json"
  },
  auto_install = true,
  highlight = {
    enable = true,
  }
}

require('treesitter-context').setup {
  enable = true,
  default = {
    patterns = { "class", "def", "function" }
  },
  context_commentstring = {
    enable = true
  }
}

require("sidebar-nvim").setup {
  open = false,
  sections = { 'datetime', 'git' }
}

require("overseer").setup()

vim.notify = require("notify")

require('dashboard').custom_center = {
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
      desc = 'Open ~/.config/nvim/init.lua            ',
      action = ':tabe ~/.config/nvim/init.lua',
      shortcut = 'SPC f d'},
      {icon = '  ',
      desc = 'Open ~/.config/nvim/lua/keymaps.lua     ',
      action = ':tabe ~/.config/nvim/lua/keymaps.lua',
      shortcut = 'SPC f k'},
  }

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").solargraph.setup{}
require("lspconfig").vuels.setup{}
require("lspconfig").bashls.setup{}
require("lspconfig").sumneko_lua.setup{}
require("lspconfig").tsserver.setup{}

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,
}

local saga = require('lspsaga')

saga.init_lsp_saga()

require"fidget".setup{}


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()


vim.cmd([[
  let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'python': ['black'],
      \ 'ruby': ['rubocop'],
      \ }
  let g:ale_fix_on_save = 1
]])

