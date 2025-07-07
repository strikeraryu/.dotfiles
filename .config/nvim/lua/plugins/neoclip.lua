return {
  'AckslD/nvim-neoclip.lua',
  config = function()
    require('neoclip').setup({
      history = 1000,
      enable_persistent_history = false,
      length_limit = 1048576,
      continuous_sync = false,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      enable_macro_history = true,
      content_spec_column = false,
      disable_keycodes_parsing = false,
      preview = true,
      default_register = ' ',
      default_register_macros = 'q',

      on_select = {
        move_to_front = false,
        close_telescope = true,
      },
      on_paste = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_replay = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_custom_action = {
        close_telescope = true,
      },

      keys = {
        telescope = {
          i = {
            select = '<cr>',
            paste = '<c-j>',
            paste_behind = '<c-k>',
            replay = '<c-q>',
            delete = '<c-d>',
            edit = '<c-e>',
            custom = {},
          },
          n = {
            select = '<cr>',
            paste = 'p',
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
            edit = 'e',
            custom = {},
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>O", "<cmd>Telescope neoclip<CR>", { desc = "Open Neoclip" })
  end
}
