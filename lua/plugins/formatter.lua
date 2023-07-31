return {
  "mhartington/formatter.nvim",
  keys = {
    { "<leader>ff", "<cmd>Format<CR>", desc = "Dar formato al archivo actual" }
  },
  config = function()
    require("formatter").setup({
      logging = false,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        }
      }
    })
  end

}
