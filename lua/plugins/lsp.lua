return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "jubnzv/virtual-types.nvim",
    "folke/lsp-colors.nvim",
    "williamboman/mason.nvim",
    -- Navegador de código, descoméntalo aquí y en lua/custom/lsp.lua si quieres usarlo
    -- {
    --   "SmiteshP/nvim-navbuddy",
    --   keys = {
    --     { "<leader>nb", "<cmd>Navbuddy<CR>", desc = "Navbuddy toggle" }
    --   },
    --   dependencies = {
    --     "SmiteshP/nvim-navic",
    --     "MunifTanjim/nui.nvim",
    --   },
    --   opts = { lsp = { auto_attach = true } }
    -- },
    {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      event = "LspAttach",
      config = function()
        require("lsp_lines").setup()
        -- LSP_LINES TOGGLE
        vim.keymap.set(
          { "n", "v" },
          "<leader>vl",
          require("lsp_lines").toggle,
          { desc = "Toggle LSP line diagnostics" }
        )
      end
    }
  },
  config = function()
    require("custom.lsp")
  end
}
