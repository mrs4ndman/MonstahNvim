return {
  {
    "mhartington/formatter.nvim",
    keys = {
      { "<leader>ff", "<cmd>Format<CR>", desc = "Dar formato al archivo actual" },
    },
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          -- Aquí configuras por tipo de archivo el formatter que quieres usar
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          -- Añade aquí los formateadores / linters a instalar y actualizar automáticamente
          "stylua",
          "prettierd",
        },
        auto_update = true,
        debounce_hours = 2,
      }
    end
  }
}
