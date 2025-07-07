return {
  {
    "tpope/vim-rails",
    dependencies = {
      "tpope/vim-dispatch",
      "tpope/vim-abolish",
      "tpope/vim-vividchalk",
    },
  },
  {
    "weizheheng/ror.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
      "nim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>ro", ":lua require('ror.commands').list_commands()<CR>",    desc = "List ROR Commands" },
      { "<leader>rf", ":lua require('ror.finders').select_finders()<CR>",    desc = "Select ROR Finders" },
      { "<leader>rr", ":lua require('ror.routes').list_routes()<CR>",        desc = "List ROR Routes" },
      { "<leader>rs", ":lua require('ror.routes').sync_routes()<CR>",        desc = "Sync ROR Routes" },
      { "<leader>rt", ":lua require('ror.schema').list_table_columns()<CR>", desc = "Show ROR Table Columns" },
    },
    config = function()
      require("ror").setup({
        test = {
          pass_icon = "",
          fail_icon = "",
        },
      })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
