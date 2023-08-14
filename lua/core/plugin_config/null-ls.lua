local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    -- (for Go)
    -- Required:
    -- go install github.com/incu6us/goimports-reviser/v3@latest
    -- go install mvdan.cc/gofumpt@latest
    -- go install github.com/segmentio/golines@latest
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    -- (for Bash)
    -- null_ls.builtins.formatting.shfmt,
    -- null_ls.builtins.diagnostics.shellcheck,
    -- null_ls.builtins.code_actions.shellcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
