return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    key_labels = { ["<leader>"] = "Espacio" },
    icons = { group = "" },
  },
  config = function(opts)
    require("which-key").setup(opts)
    -- Te recomiendo cambiar esto si cambias las binds
    require("which-key").register({
      ["<leader>f"] = { name = "Formatting, animaciones" },
      ["<leader>k"] = { name = "Ciclar buffers de harpoon" },
      ["<leader>l"] = { name = "Lazy" },
      ["<leader>m"] = { name = "Mason" },
      ["<leader>n"] = { name = "Neo-tree" },
      ["<leader>s"] = { name = "Telescope grep" },
      ["<leader>t"] = { name = "Telescope y terminales de Harpoon"}
    })
  end
}
