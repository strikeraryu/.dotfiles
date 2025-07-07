return {
  'kamykn/spelunker.vim',
  -- event = { 'BufReadPre', 'BufNewFile' },
  -- ft = { 'markdown', 'text', 'gitcommit' },
  config = function()
    local g = vim.g

    -- Core settings
    g.enable_spelunker_vim = 1
    g.enable_spelunker_vim_on_readonly = 0
    g.spelunker_target_min_char_len = 4
    g.spelunker_max_suggest_words = 15
    g.spelunker_max_hi_words_each_buf = 100
    g.spelunker_check_type = 2
    g.spelunker_highlight_type = 2

    -- Disable unnecessary checks
    g.spelunker_disable_uri_checking = 1
    g.spelunker_disable_email_checking = 1
    g.spelunker_disable_account_name_checking = 0
    g.spelunker_disable_acronym_checking = 1
    g.spelunker_disable_backquoted_checking = 0
    g.spelunker_disable_auto_group = 1

    -- Highlight groups
    g.spelunker_spell_bad_group = 'SpelunkerSpellBad'
    g.spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

    -- Use deferred large file check
    vim.api.nvim_create_autocmd("BufRead", {
      callback = function()
        vim.defer_fn(function()
          if vim.fn.getfsize(vim.fn.expand("%")) > 100000 then
            vim.g.enable_spelunker_vim = 0
          end
        end, 0)
      end,
    })

    -- Highlight setup
    vim.api.nvim_set_hl(0, 'SpelunkerSpellBad', { undercurl = true })
    vim.api.nvim_set_hl(0, 'SpelunkerComplexOrCompoundWord', { undercurl = true })

    -- Optional: toggle mapping
    vim.keymap.set("n", "<leader>ts", function()
      g.enable_spelunker_vim = 1 - g.enable_spelunker_vim
      print("Spelunker: " .. (g.enable_spelunker_vim == 1 and "ON" or "OFF"))
    end, { desc = "Toggle Spelunker", silent = true })
  end,
}
