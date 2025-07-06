return {
  {
    'ryanoasis/vim-devicons'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    priority = 999,
    config = function()
      local lualine = require('lualine')
      lualine.setup(
        {
          options = {
            theme = 'ayu_dark',
            -- component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {{  'filename', path = 1 }},
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
          },
        }
      )
    end
  },
  {
    'kdheepak/tabline.nvim',
    config = function()
      require 'tabline'.setup {
        enable = false,
        options = {
          section_separators = { '', '' },
          component_separators = { '', '' },
          max_bufferline_percent = 100,
          show_tabs_always = false,
          show_devicons = true,
          show_bufnr = false,
          show_filename_only = true,
          modified_icon = "+ ",
          modified_italic = false,
          show_tabs_only = false,
        }
      }
      vim.cmd [[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    dependencies = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup({
        view = {
          side = "right",
          width = 30,
        },
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
            },
          },
          highlight_git = false,
          highlight_opened_files = "none",
        },
        git = {
          enable = false,
        },
      })
    end
  },
  {
    'Luxed/ayu-vim',
    priority = 1000,
    config = function()
      -- Enable extended color palette for ayu theme
      vim.g.ayu_extended_palette = 1

      -- Set colorscheme
      vim.cmd("colorscheme ayu")

      -- Custom highlights
      local highlight = vim.cmd

      -- Visual selection colors
      highlight("highlight Visual cterm=NONE ctermbg=cyan ctermfg=black guifg=black guibg=#e6db74")
      -- Line numbers color
      highlight("highlight LineNr guifg=#7a7979")
      -- Hide ~ characters at end of buffer
      highlight("highlight NonText guifg=bg")
      -- Set background color
      highlight("highlight Normal guibg=#000000")
      -- Optional: Customize search highlight
      -- highlight("highlight CurSearch cterm=NONE ctermbg=cyan ctermfg=black guifg=black guibg=#37A3D9")
    end
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set header
      dashboard.section.header.val = {
        "███████╗████████╗██████╗ ██╗██╗  ██╗███████╗██████╗ ",
        "██╔════╝╚══██╔══╝██╔══██╗██║██║ ██╔╝██╔════╝██╔══██╗",
        "███████╗   ██║   ██████╔╝██║█████╔╝ █████╗  ██████╔╝",
        "╚════██║   ██║   ██╔══██╗██║██╔═██╗ ██╔══╝  ██╔══██╗",
        "███████║   ██║   ██║  ██║██║██║  ██╗███████╗██║  ██║",
        "╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝",
        "                                                    ",
        "          ⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕        ",
        "          ⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕        ",
        "          ⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕        ",
        "          ⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕        ",
        "          ⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑        ",
        "          ⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐        ",
        "          ⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐        ",
        "          ⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔        ",
        "          ⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕        ",
        "          ⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕        ",
        "          ⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕        ",
        "          ⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕        ",
        "          ⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁        ",
        "          ⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿        ",
        "                                                    "
      }

      vim.cmd('highlight AlphaHeader guifg=#c7d274')
      dashboard.section.header.opts.hl = "AlphaHeader"

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
        dashboard.button("SPC tt", "  > Toggle file explorer", ":lua NerdTreeToggleFind()<CR>"),
        dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
        dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
        dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
  }
}
