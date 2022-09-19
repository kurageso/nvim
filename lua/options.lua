-- vim.opt
vim.opt.mouse = "a"   -- マウスで操作可能にする
vim.opt.number = true -- 行番号を表示
vim.opt.autoindent = true -- 改行時に自動でインデントする


require('lualine').setup()

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

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

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
      desc = 'Open ~/.config/nvim/init.vim            ',
      action = ':tabe ~/.config/nvim/init.vim',
      shortcut = 'SPC f d'},
      {icon = '  ',
      desc = 'Open ~/.config/nvim/lua/keymaps.lua     ',
      action = ':tabe ~/.config/nvim/lua/keymaps.lua',
      shortcut = 'SPC f k'},
  }

