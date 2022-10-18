require("mason").setup()
require("mason-lspconfig").setup()

local navic = require("nvim-navic")

require("lspconfig").solargraph.setup{
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").vuels.setup{
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").bashls.setup{}
require("lspconfig").sumneko_lua.setup{}
require("lspconfig").tsserver.setup{
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

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


