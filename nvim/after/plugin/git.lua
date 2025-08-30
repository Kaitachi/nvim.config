local gitsigns = require("gitsigns")
local linker = require("gitlinker")

vim.opt.updatetime = 100

gitsigns.setup {
	numhl = true
}

-- Set fancy colors
vim.api.nvim_set_hl(0, "DiffAdded", { link = "DiffAdd" })
vim.api.nvim_set_hl(0, "DiffRemoved", { link = "DiffDelete" })
vim.api.nvim_set_hl(0, "DiffLine", { link = "IncSearch" })
vim.api.nvim_set_hl(0, "DiffSubname", { link = "StatusLine" })

-- Enable GitHub links
linker.setup({
	highlight_duration = 100
})

vim.keymap.set({ "n", "v" }, "gy", linker.link, { desc = "[GitLinker] Yank GitHub URL" })
