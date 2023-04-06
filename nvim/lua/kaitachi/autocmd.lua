local cmd = require("kaitachi.command")
-- :h skeleton


-- Enable spelling on text files
local au_ft = vim.api.nvim_create_augroup("ft", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown,org,txt,tex",
	group = au_ft,
	callback = function()
		vim.api.nvim_win_set_option(0, "spell", true)
		vim.bo.spelllang = "en_us"
	end
})

-- Use file templates (if a template exists)
local au_skeleton = vim.api.nvim_create_augroup("skeleton", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.md",
	group = au_skeleton,
	callback = function()
		if file_exists(cmd.fs.templates .. ".md") then
			vim.api.nvim_command(string.format("0r %s.md", cmd.fs.templates))
		end
	end
})

-- Relative number toggle
-- Adapted from Jeff Kreeftmeijer - thank you!
-- https://jeffkreeftmeijer.com/vim-number/#fnr.1
local au_numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
	pattern = "*",
	group = au_numbertoggle,
	callback = function()
		vim.api.nvim_command("if &nu && mode() != 'i' | set rnu | endif")
	end
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
	pattern = "*",
	group = au_numbertoggle,
	callback = function()
		vim.api.nvim_command("if &nu | set nornu | endif")
	end
})


-- Helper Functions
function file_exists(name)
	local r = io.popen(string.format(cmd.cmd.file_exists, name)):read()
	if (r == "1") then return true else return false end
end

