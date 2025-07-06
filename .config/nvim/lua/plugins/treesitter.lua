return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local ts_configs = require("nvim-treesitter.configs")
    local ts_context = require("treesitter-context")

    ts_configs.setup({
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > max_filesize
        end,
      },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = true,
      ensure_installed = {
        "bash", "c", "css", "dockerfile", "gitignore", "graphql",
        "html", "javascript", "json", "lua", "markdown", "markdown_inline",
        "prisma", "python", "ruby", "svelte", "tsx", "typescript",
        "vim", "yaml"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader><CR>",
          node_incremental = "<leader><CR>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })

    ts_context.setup({ max_lines = 2 })

    vim.keymap.set("n", "<leader>cc", function()
      ts_context.go_to_context(vim.v.count1)
    end, { silent = true, desc = "Go to Treesitter context" })
  end,
}
