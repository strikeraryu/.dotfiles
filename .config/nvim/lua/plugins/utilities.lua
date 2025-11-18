return {
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "kitty", -- or "ueberzug" or "sixel"
        processor = "magick_cli", -- or "magick_rock"
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            only_render_image_at_cursor_mode = "popup", -- or "inline"
            floating_windows = false, -- if true, images will be rendered in floating markdown windows
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            filetypes = { "norg" },
          },
          typst = {
            enabled = true,
            filetypes = { "typst" },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        scale_factor = 1.0,
        window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
        editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
      })
    end,
  },
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
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
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
