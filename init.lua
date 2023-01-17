-- vetur
vim.api.nvim_create_augroup("format", {})
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  group = "format",
  pattern = {"*.js", "*.ts", ".vue" },
  command = "Neoformat",
})

vim.api.nvim_create_augroup("vimrc_floaterm", {})
vim.api.nvim_create_autocmd({"QuitPre"}, {
  group = 'vimrc_floaterm',
  pattern = { '*' },
  command = 'FloatermKill!'
})

vim.api.nvim_create_augroup("ruby", {})
vim.api.nvim_create_autocmd({"BufNewFile, BufRead"}, {
  group = "ruby",
  pattern = "*.json.jbuilder",
  command = "setft ruby"
})

vim.cmd([[
  filetype plugin on
  augroup setAutoCompile
    autocmd!
     autocmd BufWritePost *_spec.rb :lua require('neotest').run.run(vim.fn.expand('%'))
     autocmd BufWritePost *.spec.ts,*.test.ts,*jest.ts :lua require('neotest').run.run(vim.fn.expand('%'))
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
