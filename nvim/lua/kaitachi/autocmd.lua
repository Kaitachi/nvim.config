-- :h skeleton

local au_ft = vim.api.nvim_create_augroup("ft", { clear = true })
local au_skeleton = vim.api.nvim_create_augroup("skeleton", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown,org,txt,tex",
	group = au_ft,
	callback = function()
		vim.api.nvim_win_set_option(0, "spell", true)
		vim.bo.spelllang = "en_us"
	end
})

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.md",
	group = au_skeleton,
	command = '0r ~/.config/nvim/templates/skeleton.md'
})

