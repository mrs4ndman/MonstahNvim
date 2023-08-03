return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "amarakon/nvim-cmp-buffer-lines",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp",
    "ray-x/cmp-treesitter",
    -- ChatGPT pero gratis
    -- {
    --   "jcdickinson/codeium.nvim",
    --   dependencies = "nvim-lua/plenary.nvim",
    --   commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
    --   config = true,
    -- },
    -- El autocompletado que usabamos en VSCode
    -- {
    --   "tzachar/cmp-tabnine",
    --   build = "./install.sh",
    --   config = function()
    --     local tabnine = require("cmp_tabnine.config")
    --     tabnine:setup({
    --       max_lines = 1000,
    --       max_num_results = 4,
    --       sort = true,
    --       run_on_every_keystroke = true,
    --       snippet_placeholder = "**",
    --       show_prediction_strength = false,
    --     })
    --   end
    -- },
    {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    "buschco/nvim-cmp-ts-tag-close",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  -- opts = require("custom.cmp"),
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    -- Iconos de completación
    local kind_icons = {
      Class = "󰠱",
      Color = "󰸌",
      Constant = "󰏿",
      Constructor = "",
      Enum = "",
      EnumMember = "",
      Event = "",
      Field = "󰜢",
      File = "󰈙",
      Folder = "󰉋",
      Function = "󰊕",
      Interface = "",
      Keyword = "󰌋",
      Method = "󰆧",
      Module = "",
      Operator = "󰆕",
      Property = "",
      Reference = "",
      Snippet = " ",
      Struct = "",
      Text = "",
      TypeParameter = "󰅲",
      Unit = "",
      Value = "󰎠",
      Variable = "󰀫",
      -- CAMBIA LOS ICONOS DE LAS FUENTES DE COMPLETADO AQUÍ
      buffer = "󰦨",
      path = "/",
      nvim_lsp = "λ",
      luasnip = "⋗",
      vsnip = "V",
      nvim_lua = "Π",
      Codeium = "C",
      Tabnine = "T",
    }

    -- Texto fantasma (la functión experimental de abajo)
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    cmp.setup({
      -- Quita esto si no quieres que esté seleccionado el primero automáticamente
      preselect = "item",
      -- No te recomendaría que tocases esto
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      -- Para que tome contexto del treesitter
      config = {
        context = {
          in_treesitter_capture = true,
        },
      },
      -- Estilo de la ventana, pregúntame por la documentación (te mandaré un link)
      window = {
        completion = cmp.config.window.bordered({
          border = "single",
          side_padding = 1,
          col_offset = -3,
          max_width = 80,
        }),
        documentation = cmp.config.window.bordered({
          max_width = 50,
        }),
      },
      -- Para que use los snippets correctamente
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- No te recomendaría que tocases esto
      formatting = {
        fields = { "menu", "abbr", "kind" },

        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            -- CAMBIA LOS ICONOS DE LAS FUENTES DE COMPLETADO AQUÍ TAMBIÉN
            nvim_lsp = "λ",
            luasnip = "⋗",
            nvim_lua = "Π",
            codeium = "󱍋",
            cmp_tabnine = "󱍋",
            buffer = "󰦨",
            path = "/",
            vsnip = "V",
          })[entry.source.name]

          -- Evitan entradas duplicadas
          if entry.source.name == "text" then
            vim_item.dup = 0
          end
          if entry.source.name == "nvim_lsp" then
            vim_item.dup = 0
          end
          -- Para que la ventana de sugerencias no se sobrecargue
          function Trim(text)
            local max = 40
            if text and text:len() > max then
              text = text:sub(1, max) .. "···"
            end
            return text
          end

          return vim_item
        end,
      },
      -- La manera de ordenar las completaciones
      sorting = {
        comparators = {
          -- Como de cerca están de donde estás escribiendo
          cmp.config.compare.locality,
          -- La diferencia entre lo que estás escribiendo y la sugerencia
          cmp.config.compare.offset,
          -- El tipo de completación que vendría según el contexto
          cmp.config.compare.kind,
          -- Sugerencias recientes
          cmp.config.compare.recently_used,
          -- Ordenar a su vez si cuadra o nó,
          cmp.config.compare.exact,
          -- de más corto a más largo
          cmp.config.compare.length,
          -- Sortear por el teórico orden de prioridad del LSP
          cmp.config.compare.order,
          -- Función que compara 2 strings para sacar la primera adelante
          -- No es muy necesario
          function(entry1, entry2)
            local result = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
            if result < 0 then
              return true
            end
          end,
        },
      },
      -- Teclas para el autocompletado, te recomiendo encontrar las tuyas
      mapping = cmp.mapping.preset.insert({
        -- Ir para arriba / abajo en la lista de sugerencias
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Ir para arriba / abajo en la documentación del elemento (si tiene)
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        -- Confirmar la selección de sugerencia
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        -- Avanza en snippets y si no estás en snippets, siguiente sugerencia
        ["<C-f>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Retrocede en snippets y si no estás en snippets, sugerencia anterior
        ["<C-b>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Cerrar / abortar de la ventana de completación
        ["<C-c>"] = cmp.mapping.abort(),
        -- Saca la ventana de completación sin escribir nada
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Desbindeamos Tab y Shift + Tab
        ["<Tab>"] = vim.NIL,
        ["<S-Tab>"] = vim.NIL,
      }),
      -- Fuentes de autocompletado
      sources = {
        -- Servidores LSP
        { name = "nvim_lsp" },
        -- Snippets de código
        { name = "luasnip" },
        -- IAs
        { name = "codeium" },
        { name = "cmp_tabnine" },
        -- Palabras del buffer
        {
          name = "buffer",
          options = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        -- Completado de líneas enteras de código
        -- { name = "buffer-lines" },
        -- API de Neovim
        { name = "nvim_lua" },
        { name = "crates" }, -- crates.nvim es para Rust
        -- Rutas de archivos
        { name = "path" },
        -- Otro módulo de snippets, creo que lo puedes quitar
        { name = "vsnip" },
        -- treesitter integration
        { name = "treesitter" },
      },

      -- Prueba a quitarlo y ponerlo
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
    })

    -- SETUP PARA LINEA DE COMANDOS
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      enabled = function()
        local disabled = {
          IncRename = true,
        }
        local cmd = vim.fn.getcmdline():match("%S+")
        return not disabled[cmd] or cmp.close()
      end,
      sources = cmp.config.sources(
        { { name = "path" } },
        { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
      ),
    })
  end,
}
