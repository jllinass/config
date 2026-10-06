return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Fuente principal para LSP
      "hrsh7th/cmp-buffer",   -- Sugerencias del buffer actual
      "hrsh7th/cmp-path",     -- Sugerencias de rutas de archivos
      "L3MON4D3/LuaSnip",     -- Motor de snippets
      "saadparwaiz1/cmp_luasnip", -- Fuente para luasnip
      "zbirenbaum/copilot-cmp",   -- Integración de Copilot con nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- Seleccionar ítem anterior
          ["<C-j>"] = cmp.mapping.select_next_item(), -- Seleccionar siguiente ítem
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),     -- Forzar aparición del menú
          ["<C-e>"] = cmp.mapping.abort(),            -- Cerrar menú de autocompletado
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección

          -- Navegación fluida con <Tab> y <S-Tab> (soporta autocompletado, Copilot y snippets)
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- Orden de prioridad de las fuentes de autocompletado
        sources = cmp.config.sources({
          { name = "copilot", priority = 1250 }, -- Fuente de IA (máxima prioridad)
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750 },
          { name = "buffer",   priority = 500 },
          { name = "path",     priority = 250 },
        }),
        -- Formato visual de la ventana emergente
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
}
