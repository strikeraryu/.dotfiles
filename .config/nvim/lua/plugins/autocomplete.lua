return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    {
      "L3MON4D3/LuaSnip",
      lazy = true,
      build = "make install_jsregexp",
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load VSCode-style snippets on first insert
    vim.api.nvim_create_autocmd("InsertEnter", {
      once = true,
      callback = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.filetype_extend("ruby", { "rails" })
      end,
    })

    -- Setup nvim-cmp
    local sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      experimental = {
        ghost_text = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<M-CR>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = sources,
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    -- Add custom snippets
    luasnip.add_snippets("all", {
      luasnip.snippet("timestamp", {
        luasnip.function_node(function()
          return os.date("%Y%m%d%H%M")
        end, {}),
      }),
    })
  end,
}
