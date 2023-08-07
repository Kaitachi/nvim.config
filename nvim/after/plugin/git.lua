local gitsigns = require("gitsigns")

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.opt.updatetime = 100

gitsigns.setup {
	numhl = true
}
