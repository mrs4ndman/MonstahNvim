return {
  "Bekaboo/dropbar.nvim",
  lazy = false,
  keys = {
    {
      "<leader>nv",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Pick element to navigate",
    },
  },
  opts = {
    bar = {
      pick = {
        pivots = "asdfhjlkqweruioptyzxcvbnm",
      },
    },
  },
}
