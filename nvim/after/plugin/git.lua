local gitsigns = require("gitsigns")
local linker = require("gitlinker")

function GitToggle()
	local fugitive_bufnr = vim.fn.bufnr("^fugitive:")
	local fugitive_winid = vim.fn.bufwinid(fugitive_bufnr)

	if fugitive_bufnr >= 0 and fugitive_winid >= 0 then
		vim.api.nvim_win_close(fugitive_winid, false)
	else
		vim.cmd(":G")
	end
end

vim.keymap.set("n", "<F10>", GitToggle, { desc = "Toggle Git Status" })

vim.opt.updatetime = 100

gitsigns.setup {
	numhl = true
}

-- Set fancy colors
vim.api.nvim_set_hl(0, "DiffAdded", { link = "DiffAdd" })
vim.api.nvim_set_hl(0, "DiffRemoved", { link = "DiffDelete" })
vim.api.nvim_set_hl(0, "DiffLine", { link = "OctoGreyFloat" })
vim.api.nvim_set_hl(0, "DiffSubname", { link = "OctoBlueFloat" })

-- Enable GitHub links
linker.setup({
	highlight_duration = 100
})

vim.keymap.set({ "n", "v" }, "gy", linker.link, { desc = "Yank GitHub URL" })
