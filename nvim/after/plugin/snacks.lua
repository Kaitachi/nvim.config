local snacks = require("snacks")

snacks.setup({
	lazygit = {

	},
})

vim.keymap.set('n', '<F10>', snacks.lazygit.open, { desc = "[Snacks] Open LazyGit" })
vim.keymap.set('n', '<F12>', snacks.lazygit.log_file, { desc = "[Snacks] Open LazyGit Log File" })
