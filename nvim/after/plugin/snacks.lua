local snacks = require("snacks")

snacks.setup({
	debug = {},
	indent = {},
	input = {},
	lazygit = {},
})

-- lazygit config
vim.keymap.set('n', '<F10>', snacks.lazygit.open, { desc = "[Snacks] Open LazyGit" })
vim.keymap.set('n', '<F12>', snacks.lazygit.log_file, { desc = "[Snacks] Open LazyGit Log File" })

-- terminal config
vim.keymap.set('n', '<F7>', function() snacks.terminal("lazydocker") end, { desc = "[Snacks] Open LazyDocker" })
