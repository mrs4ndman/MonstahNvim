return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Setup para Lua
    "folke/neodev.nvim",
    -- No sé si funciona, pero déjalo estar xddd, ví que funcionaba con Ocaml
    "jubnzv/virtual-types.nvim",
    -- Esto da colores a sintaxis que el LSP no cubre
    "folke/lsp-colors.nvim",
    -- Gestor de LSP, formatters y demás
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
    -- OTRA MANERA DE MOSTRAR DIAGNÓSTICOS: EN LUA/CUSTOM/LSP.LUA HAY OTRO COMENTARIO
    -- IGUAL QUE ESTE, AL FINAL DEL ARCHIVO
    -- SI QUIERES PROBARLA, DESCOMENTA ESTE ↓↓↓ BLOQUE Y EL DE LUA/CUSTOM/LSP.LUA QUE TE DIGO
    -- {
    --   url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --   event = "LspAttach",
    --   config = function()
    --     require("lsp_lines").setup()
    --     -- LSP_LINES TOGGLE
    --     vim.keymap.set(
    --       { "n", "v" },
    --       "<leader>vl",
    --       require("lsp_lines").toggle,
    --       { desc = "Toggle LSP line diagnostics" }
    --     )
    --   end
    -- }
  },
  config = function()
    require("custom.lsp")
  end
}
