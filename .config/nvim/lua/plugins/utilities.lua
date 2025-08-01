return {
  {
    'christoomey/vim-tmux-navigator'
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    -- branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require('harpoon')
      harpoon.setup({
        global_settings = {
          mark_branch = true
        },
        menu = {
          width = 80
        }
      })

      vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)
      vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
      vim.keymap.set("n", "<M-1>", function() require("harpoon.ui").nav_file(1) end)
      vim.keymap.set("n", "<M-2>", function() require("harpoon.ui").nav_file(2) end)
      vim.keymap.set("n", "<M-3>", function() require("harpoon.ui").nav_file(3) end)
      vim.keymap.set("n", "<M-4>", function() require("harpoon.ui").nav_file(4) end)
      vim.keymap.set("n", "<M-5>", function() require("harpoon.ui").nav_file(5) end)
      vim.keymap.set("n", "<C-S-P>", function() require("harpoon.ui").nav_prev() end)
      vim.keymap.set("n", "<C-S-N>", function() require("harpoon.ui").nav_next() end)
    end
  },
  { 'ap/vim-css-color', },
  { 'mechatroner/rainbow_csv' },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  },
  {
    "rmagatti/auto-session",
    config = function()
      local auto_session = require("auto-session")
      local session_lens = require("auto-session.session-lens")

      auto_session.setup({
        auto_restore_enabled = false,
        auto_session_suppress_dirs = {
          "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/",
        },
        bypass_session_save_file_types = { "alpha" },
      })

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", vim.tbl_extend("force", opts, {
        desc = "Restore session for cwd",
      }))
      vim.keymap.set("n", "<leader>wl", "<cmd>SessionSave<CR>", vim.tbl_extend("force", opts, {
        desc = "Save session for root dir",
      }))
      vim.keymap.set("n", "<C-s>", session_lens.search_session, vim.tbl_extend("force", opts, {
        desc = "Search sessions",
      }))
    end,
  }
}
