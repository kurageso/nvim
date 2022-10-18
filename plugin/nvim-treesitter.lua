require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "ruby", "javascript", "lua", "typescript", "vue", "jsdoc", "html", "yaml", "vim", "vue", "json"
  },
  auto_install = true,
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  autowise = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
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


