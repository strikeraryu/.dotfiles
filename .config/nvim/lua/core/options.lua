-- Set options
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'noinsert', 'menuone', 'noselect' }
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 15
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ttimeoutlen = 0
vim.opt.wildmenu = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.g.pumheight = 15
vim.opt.laststatus = 3
vim.opt.winbar='%t %m'

-- File Browser
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.cmd('set t_Co=256')
