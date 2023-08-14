require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls", "bashls"}
})

-- Auto completion = Autocompletion + Snippet Engine
-- For Auto completion (Should included in each lsp setup block)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--

-- snippet setup for each lang
-- (Lua)
require("lspconfig").lua_ls.setup {
  capabilities = capabilities
}
-- (Go)
local util = require "lspconfig/util"
require("lspconfig").gopls.setup {
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
-- (Bash)
require("lspconfig").bashls.setup {
  capabilities = capabilities,
  filetypes = { "sh" }
}
