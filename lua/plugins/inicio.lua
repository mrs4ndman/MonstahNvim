
return {
  "goolord/alpha-nvim",
  -- event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  priority = 1000,
  opts = function(_, opts)
      opts = opts.dashboard
  end,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    -- It uses almost the same format as the "date" command in Linux (man date for info)
    local time = os.date("%_k:%M - %a - %b %d")

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    -- La parte de abajo del todo, esto son funciones custom, te las puedo quitar si quieres
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local v = vim.version()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
          "",
          "",
          "",
          "           " .. time,
          "",
          "               Neovim " .. v.major .. "." .. v.minor .. "." .. v.patch,
          "",
          "     " .. stats.count .. " plugins | " .. ms .. "ms |  monstahcode" ,
          "",
          "",
          "",
          "",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    if vim.api.nvim_exec("echo argc()", true) == "0" then
      -- La parte de arriba, el "header" / cabecera
      dashboard.section.header.val = {

        "                                                                                    ",
        "                                                                                    ",
        "                                                                                    ",
        "                                                                                    ",
        "         ███╗   ███╗ ██████╗ ███╗   ██╗███████╗████████╗ █████╗ ██╗  ██╗            ",
        "         ████╗ ████║██╔═══██╗████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║  ██║            ",
        "         ██╔████╔██║██║   ██║██╔██╗ ██║███████╗   ██║   ███████║███████║            ",
        "         ██║╚██╔╝██║██║   ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██╔══██║            ",
        "         ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████║   ██║   ██║  ██║██║  ██║            ",
        "         ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝            ",
        "                                                                                    ",
        "                                                                                    ",
        "                                                                                    ",
        "                                   N E O V I M                                      ",
        "                                                                                    ",
        "                                      ／|__                                         ",
        "                                     (o o /                                         ",
        "_____________________________________ |.   ~. _____________________________________ ",
        "                                      じしf_,)ノ                                    ",
        "                                                                                    ",
      }
      -- La parte del medio, las teclas que puedes pulsar en la dashboard como atajos
      dashboard.section.buttons.val = {
        dashboard.button("n", "    Nuevo archivo", "<cmd>ene<CR>"),
        dashboard.button("", "La tecla invoca el comando que escribas en el siguiente campo, netrw / Ex en este caso"),
        dashboard.button("e", "󰝰    Ex", ":Explore<CR>"),
        dashboard.button("v", "    Recuperar sesión (No lo tienes instalado)", ":SessionRestore<CR>"),
        dashboard.button("f", "󰈞    Buscar archivo en el proyecto / directorio", ":Telescope find_files<CR>"),
        dashboard.button("h", "󱂵    Home dir find", ":cd $HOME | Telescope find_files<CR>"),
        dashboard.button("r", "    Recientes", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "󰊄    Buscar patrón", ":Telescope live_grep<CR>"),
        dashboard.button("l", "󰒲    Lazy", ":Lazy<CR>"),
        dashboard.button("q", "󰿅    Salir", ":qa<CR>"),
      }
      -- Llamamos todo el setup para que funcione
      alpha.setup(dashboard.opts)

      -- Para que el buffer no esté contaminado de números ni statuslines
      vim.cmd([[ autocmd Filetype alpha setlocal nofoldenable signcolumn=no nonumber norelativenumber ]])
    end
  end,
}
