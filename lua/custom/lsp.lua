-- LSP Explicit config
-- local navic = require("nvim-navic")
-- local navbuddy = require("nvim-navbuddy")
local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
---@diagnostic disable-next-line: missing-fields
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}
--
-- Le tienes que pasar esto a cada lsp, como los q ya tienes
-- LSP Attach keybinds
M.on_attach = function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration" })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { desc = "[G]o to [T]ype definition" })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation" })
  -- Ayuda (te lo comento pq a mí me molesta a veces si hago K)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, { desc = "Workspace Symbol" })
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Diagnostic Float on current word" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
  vim.keymap.set("n", "d]", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
  vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { desc = "View code action" })
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { desc = "Show Variable References" })
  vim.keymap.set({ "n", "v" }, "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename variable with LSP" })
  vim.keymap.set("i", "<C-q>", vim.lsp.buf.signature_help, { desc = "Quickhelp on word" })

  -- Diagnósticos flotantes
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
  -- navic.attach(client, bufnr)
  -- SI QUIERES DESCOMENTA ESTO Y LA PIEZA DE PLUGINS/LSP.LUA QUE PONE NAVBUDDY
  -- navbuddy.attach(client, bufnr)
  require("virtualtypes").on_attach()
end
-- First, Native LSP
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
lspconfig.rust_analyzer.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
})
lspconfig.clangd.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})
lspconfig.astro.setup({})
lspconfig.pylsp.setup({})
lspconfig.vimls.setup({})
lspconfig.marksman.setup({})
lspconfig.ocamlls.setup({})
lspconfig.neocmake.setup({})
lspconfig.html.setup({})
-- lspconfig.emmet_ls.setup({})
lspconfig.cssls.setup({})
lspconfig.gopls.setup({})
lspconfig.eslint.setup({})
lspconfig.tsserver.setup({})
lspconfig.bashls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.yamlls.setup({})
lspconfig.ruby_ls.setup({})
-- lspconfig.jdtls.setup {}

-- Change here the left sidebar LSP icon config for:
local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- BLOQUE DE CÓDIGO QUE TE DECÍA
vim.diagnostic.config({
  virtual_text = true, -- COMENTARÍAS ESTO
  -- virtual_text = false, -- Y DESCOMENTAS ESTAS 2
  -- virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
