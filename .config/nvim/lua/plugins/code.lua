return {
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({ check_ts = true })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      local comment = require("Comment")
      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

      comment.setup({
        pre_hook = ts_context_commentstring.create_pre_hook(),
      })
    end,
  },
  {
    'ThePrimeagen/refactoring.nvim',
    config = function()
      local refactor = require('refactoring')
      local keymap = vim.keymap.set

      -- Extract Function
      keymap("x", "<leader>re", function() refactor.refactor('Extract Function') end, {desc = "Extract selected code into a new function"})

      -- Extract Function To File
      keymap("x", "<leader>rf", function() refactor.refactor('Extract Function To File') end, {desc = "Extract selected code into a new function and move it to a separate file"})

      -- Extract Block
      keymap("n", "<leader>rb", function() refactor.refactor('Extract Block') end, {desc = "Extract current block of code into a new function"})

      -- Extract Block To File
      keymap("n", "<leader>rbf", function() refactor.refactor('Extract Block To File') end, {desc = "Extract current block of code into a new function and move it to a separate file"})

      -- Add Print
      keymap("n", "<leader>rp", function() refactor.debug.printf({below = false}) end, {desc = "Insert a print statement for debugging purposes"})

      -- Add Var Print
      keymap({"x", "n"}, "<leader>rv", function() refactor.debug.print_var() end, {desc = "Insert a print statement for a variable for debugging purposes"})

      -- Cleanup Print
      keymap("n", "<leader>rc", function() refactor.debug.cleanup({}) end, {desc = "Remove all print statements added for debugging"})
    end
  }
}
