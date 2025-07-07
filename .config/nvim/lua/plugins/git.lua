return {
  { 'tpope/vim-fugitive' },
  {
    "mattn/vim-gist",
    dependencies = { "mattn/webapi-vim" },
    config = function()
      -- Gist Configuration
      vim.g.gist_enable_browser = 1
      vim.g.gist_clip_command = "xclip -selection clipboard"

      local function set_gist_token()
        local local_path = "./.gist_token"
        local global_path = vim.fn.expand("~/.gist_token")
        local file = io.open(local_path, "r") or io.open(global_path, "r")

        if file then
          local token = file:read("*a")
          file:close()
          token = token:match("^%s*(.-)%s*$")
          vim.g.gist_token = token
        else
          vim.notify("No gist token found in ./.gist_token or ~/.gist_token", vim.log.levels.WARN)
        end
      end

      set_gist_token()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      sign_priority = 100,

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc, silent = true })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk (Visual)")
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk (Visual)")
        map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")

        -- Blame & Diff
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line (Full)")
        map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle Line Blame")
        map("n", "<leader>hd", gs.diffthis, "Diff This")
        map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This (against ~)")

        -- Text Object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")

        -- Highlight customization
        vim.cmd("highlight GitSignsCurrentLineBlame guifg=grey")
      end,
    },
  }
}
