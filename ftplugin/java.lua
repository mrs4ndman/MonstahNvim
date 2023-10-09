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

local config = {
  capabilities = M.capabilities,
  on_attach = M.on_attach,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = { "/home/mrsandman/.local/share/nvim/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", ".javastart" }, { upward = true })[1]),
}

require("jdtls").start_or_attach(config)

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4
