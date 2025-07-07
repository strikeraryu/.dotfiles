return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_lines = false })
      vim.keymap.set("", "<Leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
        ["Select All"] = "<C-d>",
        ["Visual Add"] = "<C-m>",
      }

      vim.keymap.set("n", "<M-Down>", "<Plug>(VM-Add-Cursor-Down)", { desc = "Add cursor down" })
      vim.keymap.set("n", "<M-Up>", "<Plug>(VM-Add-Cursor-Up)", { desc = "Add cursor up" })
      vim.keymap.set("n", "<M-j>", "<Plug>(VM-Add-Cursor-Down)", { desc = "Add cursor down" })
      vim.keymap.set("n", "<M-k>", "<Plug>(VM-Add-Cursor-Up)", { desc = "Add cursor up" })

      vim.cmd("highlight VM_Mono cterm=None ctermbg=cyan ctermfg=238 gui=underline guifg=red")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup { indent = { highlight = highlight }, enabled = false }
      vim.api.nvim_set_keymap("n", "<Leader>bl", "<cmd>IBLToggle<CR>", { desc = "Toggle blankline" })
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    cmd = "NoNeckPain",
    keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
    config = function()
      require("no-neck-pain").setup({
        width = 120,
      })
    end,
  },
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
    end,
  },
}
