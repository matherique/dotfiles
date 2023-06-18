local lsp = require('lsp-zero').preset({})

require('go').setup()
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})



lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


require('lspconfig').tsserver.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').gopls.setup({
  cmd = { "gopls" },
  filetypes = { "go", "gomod","gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
    }
  },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

