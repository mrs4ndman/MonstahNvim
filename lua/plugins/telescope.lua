return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- TECLAS DEL TELESCOPE
    { "<leader>tf", "<cmd>Telescope find_files<CR>",  desc = "Buscar archivos" },
    { "<leader>tb", "<cmd>Telescope buffers<CR>",     desc = "Lista de buffers" },
    { "<leader>tr", "<cmd>Telescope oldfiles<CR>",    desc = "Archivos recientes" },
    { "<leader>tl", "<cmd>Telescope loclist<CR>",     desc = "Lista de errores" },
    { "<leader>vh", "<cmd>Telescope help_tags<CR>",   desc = "Tags de ayuda de comandos" },
    { "<leader>sg", "<cmd>Telescope grep_string<CR>", desc = "Buscar esta string" },
    {
      "<leader>tg",
      "<cmd> Telescope grep_string({ search = vim.fn.input() })<CR>",
      desc = "Buscar patrón a través del proyecto",
    },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        -- Si quieres tener la preview del archivo activada cuando hay espacio suficiente
        colorscheme = { enable_preview = true },
        find_files = {
          -- Puedes comentar esto si no tienes fd instalado
          find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--strip-cwd-prefix" },
          theme = "ivy",
        },
      },
      defaults = {
        -- El estilo de UI por defecto, luego se puede cambiar picker por picker (línea 28)
        theme = "dropdown",
        -- Necesitas "rg" para poder hacer grep a través de un proyecto
        vimgrep_arguments = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        -- Opciones de sorting muy lógicas
        sort_mru = true,
        sorting_strategy = "ascending",
        color_devicons = true,
        -- Puedes probar a tocar estos ajustes, igualmente puedes ver la documentación
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
          horizontal = { width_padding = 0.04, height_padding = 0.1 },
          vertical = { width_padding = 0.05, height_padding = 1 },
        },
        border = true,
        prompt_prefix = "   ",
        hl_result_eol = false,
        -- results_title = "",
        wrap_results = true,
        hidden = true,
        -- Teclas cuando ya tienes telescope abierto, para esto si que necesitas
        -- leer la documentación
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
            ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            -- ["<M-p>"] = action_layout.toggle_preview,
          },
          n = {
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<M-s>"] = require("telescope.actions").file_split,
            ["<M-v>"] = require("telescope.actions").file_vsplit,
            -- ["<M-p>"] = action_layout.toggle_preview,
          },
        },
      },
    })
  end,
}
