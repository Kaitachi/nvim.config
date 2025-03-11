local gitsigns = require("gitsigns")

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.opt.updatetime = 100

gitsigns.setup {
	numhl = true
}

-- Set fancy colors
vim.api.nvim_set_hl(0, "DiffAdded", { ctermbg = "DarkGreen", ctermfg = "Black", bg = "#008800", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiffChange", { ctermbg = "Yellow", ctermfg = "Black", bg = "#f4c900", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiffRemoved", { ctermbg = "DarkRed", ctermfg = "Black", bg = "#b90000", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiffLine", { ctermbg = "Blue", ctermfg = "White", bg = "#0000bd", fg = "#ffffff" })
