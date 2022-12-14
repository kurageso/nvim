-- vetur
vim.api.nvim_create_augroup("format", {})
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  group = "format",
  pattern = {"*.js", "*.ts", ".vue" },
  command = "Neoformat",
})

vim.cmd([[
augroup vimrc_floaterm
  autocmd!
  autocmd QuitPre * FloatermKill!
augroup END
]])

vim.cmd([[
augroup Ruby
  autocmd!
  autocmd BufNewFile, BufRead *.json.jbuilder set ft=ruby
augroup END
]])


vim.cmd([[
  filetype plugin on
  augroup setAutoCompile
    autocmd!
     autocmd BufWritePost *_spec.rb :lua require('neotest').run.run(vim.fn.expand('%'))
     autocmd BufWritePost *.spec.ts,*.test.ts,*jest.ts :lua require('neotest').run.run(vim.fn.expand('%'))
     autocmd BufWritePost *_test.go :lua require('neotest').run.run(vim.fn.expand('%'))

     autocmd BufWritePost *_spec.rb :lua require('neotest').summary.open()
     autocmd BufWritePost *.spec.ts :lua require('neotest').summary.open()
     autocmd BufWritePost *_test.go :lua require('neotest').summary.open()
  augroup END
]])

require("plugins")
require("options")
require("keymaps")

vim.cmd([[
    augroup scrollbar_search_hide
        autocmd!
        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
    augroup END
]])

vim.cmd([[
  set nocompatible
  filetype plugin on
  runtime macros/matchit.vim
]])
