local autocmd = vim.api.nvim_create_autocmd

-- Remember cursor position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, {row, col})
    end
  end
})

autocmd('TextYankPost', {
    desc = 'Highlight yanked text',
    group = vim.api.nvim_create_augroup('HighlightYank', {}),
    pattern = '*',
    callback = function()
      vim.hl.on_yank({higroup='Visual', timeout=150})
    end,
})
