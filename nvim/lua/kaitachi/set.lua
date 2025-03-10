vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight current cursor line
vim.opt.showmode = false -- Don't show current mode (lightline takes care of this)

-- Whitespace and indentations
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.list = false
vim.opt.listchars = { tab = '▷ ', trail = '·', extends = '»', precedes = '«' , nbsp = '␣', eol = '↵' }
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
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Settings for vimwiki
vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")
vim.cmd("syntax on")

-- Highlight settings
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "DiffAdded", { ctermbg = "DarkGreen", ctermfg = "Black", bg = "#008800", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiffChange", { ctermbg = "Yellow", ctermfg = "Black", bg = "#f4c900", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiffRemoved", { ctermbg = "DarkRed", ctermfg = "Black", bg = "#b90000", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiffLine", { ctermbg = "Blue", ctermfg = "White", bg = "#0000bd", fg = "#ffffff" })
