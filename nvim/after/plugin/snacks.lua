local snacks = require("snacks")

snacks.setup({
	debug = {},
	indent = {},
	input = {},
	lazygit = {},
})

-- default highlight: NormalFloat

--#region lazygit config
vim.keymap.set('n', '<F10>', function()
	vim.api.nvim_set_hl(0, "SnacksNormal", { link = "NormalFloat" })
	snacks.lazygit.open()
end, { desc = "[Snacks] Open LazyGit" })
vim.keymap.set('n', '<F12>', snacks.lazygit.log_file, { desc = "[Snacks] Open LazyGit Log File" })
--#endregion


--#region terminal config
vim.keymap.set('n', '<F7>', function()
	vim.api.nvim_set_hl(0, "SnacksNormal", { link = "ansi12_bg" })
	snacks.terminal("lazydocker")
end, { desc = "[Snacks] Open LazyDocker" })
--#endregion


--#region picker config
-- Snacks Search
vim.keymap.set('n', '<leader><leader>', snacks.picker.pickers, { desc = "[Snacks] Show Pickers" })

-- Vim Search
vim.keymap.set('n', '<leader>h', snacks.picker.help, { desc = "[Snacks] Search Help" })
vim.keymap.set('n', '<leader>k', snacks.picker.keymaps, { desc = "[Snacks] Show Vim Keymaps" })
vim.keymap.set('n', '<leader>m', snacks.picker.marks, { desc = "[Snacks] Show Vim Marks" })
vim.keymap.set('n', '<leader>r', snacks.picker.registers, { desc = "[Snacks] Show Vim Registers" })
vim.keymap.set('n', '<leader>b', snacks.picker.buffers, { desc = "[Snacks] Show Vim Buffers" })
vim.keymap.set('n', '<leader>c', snacks.picker.commands, { desc = "[Snacks] Show Vim Commands" })

-- File Search
vim.keymap.set('n', '<leader>=', snacks.picker.files, { desc = "[Snacks] Find Files" })
vim.keymap.set('n', '+', snacks.picker.smart, { desc = "[Snacks] Smart Find Files" })
-- TODO: Cannot fuzzy-find
vim.keymap.set('n', '<leader>f', function()
	snacks.picker.grep({ live = true })
end, { desc = "[Snacks] Fuzzy-Find Text" })
--#endregion
