return {
  {
    "nvim-treesitter/nvim-treesitter", -- parsing to the end of time
    -- event = "VeryLazy",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "TSInstall",
    -- build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      -- Añade highlighting más concreto, para distinguir bien las cosas
      "David-Kunz/markid",
      -- ESTO VA CON EL markid = { enable = true } de la línea 45
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Sigue su documentación para instalar highlighting para nuevos lenguajes
        -- También puedes hacer :TSInstall y darle al Tab para completar
        ensure_installed = {
          "astro",
          "c",
          "bash",
          "cpp",
          "css",
          "gitcommit",
          "gitignore",
          "go",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "php",
          "rust",
          "tsx",
          "typescript",
          "toml",
          "vim",
          "vimdoc",
          "yaml",
        },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        autotag = { enable = true },
        markid = { enable = true },
      })
    end,
  },
  {
    -- PARÉNTESIS DE COLORINES :D
    "HiPhish/rainbow-delimiters.nvim",
    enabled = false,
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
