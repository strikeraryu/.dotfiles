-- Command to send the current file in the easy-send folder
vim.api.nvim_create_user_command('Easysend', function()
  local file_path = vim.fn.expand('%')
  if file_path ~= '' then
    os.execute('cp ' .. vim.fn.shellescape(file_path) .. ' ~/easy-send')
    print("File added to ~/easy_send")
  else
    print("No file to copy!")
  end
end, {})

vim.api.nvim_create_user_command('RemoveFromQuickfix', function()
  local qf = vim.fn.getqflist()
  local idx = vim.fn.getqflist({ idx = 0 }).idx
  table.remove(qf, idx)
  vim.fn.setqflist(qf, 'r')
end, {})


vim.api.nvim_create_user_command('ToggleWrap', function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.notify("Word wrap disabled", vim.log.levels.INFO)
  else
    vim.wo.wrap = true
    vim.notify("Word wrap enabled", vim.log.levels.INFO)
  end
end, {})
