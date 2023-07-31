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
      config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
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
      buffer = "󰦨",
      path = "/",
      nvim_lsp = "λ",
      luasnip = "⋗",
      vsnip = "V",
      nvim_lua = "Π",
      Codeium = "C",
      Tabnine = "T"
    }

    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    cmp.setup({
      preselect = "item",
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      config = {
        context = {
          in_treesitter_capture = true,
        },
      },
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
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { "menu", "abbr", "kind" },

        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            -- CAMBIA LOS ICONOS DE COMPLETADO AQUÍ
            nvim_lsp = "λ",
            luasnip = "⋗",
            nvim_lua = "Π",
            codeium = "󱍋",
            cmp_tabnine = "󱍋",
            buffer = "󰦨",
            path = "/",
            vsnip = "V",
          })[entry.source.name]

          if entry.source.name == "text" then
            vim_item.dup = 0
          end
          if entry.source.name == "nvim_lsp" then
            vim_item.dup = 0
          end

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
      sorting = {
        comparators = {
          cmp.config.compare.locality,
          cmp.config.compare.offset,
          cmp.config.compare.kind,
          cmp.config.compare.recently_used,
          cmp.config.compare.exact,
          cmp.config.compare.length,
          cmp.config.compare.order,
          function(entry1, entry2)
            local result = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
            if result < 0 then
              return true
            end
          end,
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-c>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = vim.NIL,
        ["<S-Tab>"] = vim.NIL,
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "treesitter" },
        { name = "luasnip" },
        { name = "codeium" },
        { name = "cmp_tabnine" },
        -- { name = "buffer-lines" },
        { name = "nvim_lua" },
        { name = "crates" }, -- crates.nvim es para Rust
        { name = "path" },
        { name = "vsnip" },
        { name = "treesitter" }, -- treesitter integration
        {
          name = "buffer",
          options = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      }
    })


    -- SETUP PARA LINEA DE COMANDOS
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      enabled = function()
        local disabled = {
          IncRename = true
        }
        local cmd = vim.fn.getcmdline():match("%S+")
        return not disabled[cmd] or cmp.close()
      end,
      sources = cmp.config.sources({ { name = 'path' } },
        { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } })
    })
  end
}
