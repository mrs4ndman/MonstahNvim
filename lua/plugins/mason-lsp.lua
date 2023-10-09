return {
  "williamboman/mason-lspconfig.nvim",
  cmd = { "LspInstall", "LspUninstall" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- Lista de LSPs (SOLO LSPs) a instalar automáticamente
        -- Se instalan automágicamente xddd, añade a la lista si necesitas más
        "lua_ls",
        "vimls",
        "marksman",
        "clangd",
        "neocmake",
        "html",
        -- 'hls',
        "cssls",
        "eslint",
        "tsserver",
        "bashls",
        "ansiblels",
        "dockerls",
        "yamlls",
        "ruff_lsp",
        "rust_analyzer",
        "ruby_ls",
        "pylsp",
        "gopls",
        "jdtls",
        "jsonls",
      },
      automatic_installation = true,
    })
  end,
}
