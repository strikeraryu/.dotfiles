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
