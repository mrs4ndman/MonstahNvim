return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
      background = { light = "latte", dark = "macchiato" },
      transparent_background = false,
      show_end_of_buffer = false,
      dim_inactive = { enabled = false, shade = "dark", percentage = 0.2 },
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        harpoon = true,
        illuminate = true,
        lsp_trouble = true,
        leap = true,
        mason = true,
        mini = true,
        navic = { enabled = true },
        noice = true,
        notify = true,
        nvimtree = true,
        rainbow_delimiters = true,
        telescope = true,
        treesitter_context = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function()
      -- vim.opt.guicursor = ""
      vim.cmd("colorscheme catppuccin")
    end,
  },
  -- Puedes añadir más temas debajo, si quieres te paso un snippet para el switcher
  -- {
  --   "rose-pine/nvim"
  -- },
}
