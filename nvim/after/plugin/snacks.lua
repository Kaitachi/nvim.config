local snacks = require("snacks")

snacks.setup({
	debug = {},
	indent = {},
	input = {},
	lazygit = {},
})

-- default highlight: NormalFloat

-- lazygit config
vim.keymap.set('n', '<F10>', function()
	vim.api.nvim_set_hl(0, "SnacksNormal", { link = "NormalFloat" })
	snacks.lazygit.open(lazygit_opts)
end, { desc = "[Snacks] Open LazyGit" })
vim.keymap.set('n', '<F12>', snacks.lazygit.log_file, { desc = "[Snacks] Open LazyGit Log File" })

-- terminal config
vim.keymap.set('n', '<F7>', function()
	vim.api.nvim_set_hl(0, "SnacksNormal", { link = "ansi12_bg" })
	snacks.terminal("lazydocker")
end, { desc = "[Snacks] Open LazyDocker" })
