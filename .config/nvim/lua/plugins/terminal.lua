return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    toggleterm.setup({
      size = 15,
      open_mapping = nil, -- remove to avoid conflict with custom mappings
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Shared float options
    local float_opts = { border = "double" }

    -- Custom terminals
    local terminals = {
      lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = false,
        direction = "float",
        float_opts = float_opts,
      }),
      btop = Terminal:new({
        cmd = "btop",
        hidden = false,
        direction = "float",
        float_opts = float_opts,
      }),
      ttyper = Terminal:new({
        cmd = "ttyper -w 20",
        hidden = false,
        direction = "float",
        float_opts = float_opts,
      }),
    }

    -- Toggle function
    local function toggle_term(name)
      local term = terminals[name]
      if term then term:toggle() end
    end

    local opts = { noremap = true, silent = true }

    -- Float terminal mapping (<M-\>)
    for _, mode in ipairs({ "n", "i", "t" }) do
      vim.keymap.set(mode, [[<M-\>]],
        '<Cmd>execute v:count . "ToggleTerm direction=float"<CR>',
        vim.tbl_extend("force", opts, { desc = "Toggle Float Terminal" }))
    end

    -- Horizontal terminal mapping (<C-\>)
    for _, mode in ipairs({ "n", "i", "t" }) do
      vim.keymap.set(mode, [[<C-\>]],
        '<Cmd>execute v:count . "ToggleTerm direction=horizontal"<CR>',
        vim.tbl_extend("force", opts, { desc = "Toggle Horizontal Terminal" }))
    end

    -- Custom terminal toggles
    vim.keymap.set("n", "<leader>lg", function() toggle_term("lazygit") end, opts)
    vim.keymap.set("n", "<leader>bt", function() toggle_term("btop") end, opts)
    vim.keymap.set("n", "<leader>tt", function() toggle_term("ttyper") end, opts)
  end,
}
