vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Whitespace and indentations
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.list = true
vim.opt.listchars = { tab = '▷ ', trail = '·', extends = '»', precedes = '«' , nbsp = '○', eol = '↵' }
vim.opt.smartindent = true

vim.opt.wrap = false

-- File Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = (os.getenv("HOME") or os.getenv("UserProfile")) .. "/.vim/undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Settings for vimwiki
vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
--vim.opt.colorcolumn = "80"
