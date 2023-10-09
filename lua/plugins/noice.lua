return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- Minimenú de carga abajo a la derecha para los LSPs +
    -- Integración con documentación
    lsp = {
      progress = {
        enabled = true,
        view = "mini",
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- Prueba a poner estos en false y reiniciar para ver los cambios
    -- También puedes ver la documentacióń en https://github.com/folke/noice.nvim
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = false,
    },
    -- Integra nvim-notify y noice.nvim
    routes = {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
}
