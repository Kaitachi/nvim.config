local gitsigns = require("gitsigns")

vim.keymap.set("n", "<leader>g", vim.cmd.Git, {})

vim.opt.updatetime = 100

gitsigns.setup {
	numhl = true
}

-- Set fancy colors
vim.api.nvim_set_hl(0, "DiffAdded", { link = "DiffAdd" })
vim.api.nvim_set_hl(0, "DiffRemoved", { link = "DiffDelete" })
vim.api.nvim_set_hl(0, "DiffLine", { link = "OctoGreyFloat" })
vim.api.nvim_set_hl(0, "DiffSubname", { link = "OctoBlueFloat" })
