local cmd = require("kaitachi.command")


-- Enable spelling on text files
local au_ft = vim.api.nvim_create_augroup("ft", { clear = true })
vim.api.nvim_create_autocmd({"FileType"}, {
	desc = "[spell] Enable spelling on text files",
	pattern = { "markdown", "org", "txt", "tex" },
	group = au_ft,
	callback = function()
		vim.api.nvim_win_set_option(0, "spell", true)
		vim.bo.spelllang = "en_us"
	end
})


-- Relative number toggle
-- Adapted from Jeff Kreeftmeijer - thank you!
-- https://jeffkreeftmeijer.com/vim-number/#fnr.1
local au_numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
	desc = "[rnu] Toggle (on) relative numbers when leaving Insert mode",
	pattern = "*",
	group = au_numbertoggle,
	callback = function()
		vim.api.nvim_command("if &nu && mode() != 'i' | set rnu | endif")
	end
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
	desc = "[rnu] Toggle (off) relative numbers when entering Insert mode",
	pattern = "*",
	group = au_numbertoggle,
	callback = function()
		vim.api.nvim_command("if &nu | set nornu | endif")
	end
})


-- Diagnostic toggle
local au_diagnostictoggle = vim.api.nvim_create_augroup("diagnostictoggle", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
	desc = "[diag] Toggle (on) diagnostic virtual text when leaving Insert mode",
	pattern = "*",
	group = au_diagnostictoggle,
	callback = function()
		vim.diagnostic.config({ virtual_text = true })
	end
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
	desc = "[diag] Toggle (off) diagnostic virtual text when entering Insert mode",
	pattern = "*",
	group = au_diagnostictoggle,
	callback = function()
		vim.diagnostic.config({ virtual_text = false })
	end
})


-- Highlight text that is being yanked
local au_hy = vim.api.nvim_create_augroup("hy", { clear = true })
vim.api.nvim_create_autocmd({"TextYankPost"}, {
	desc = "[y] Highlight when yanking text",
	group = au_hy,
	callback = function()
		vim.highlight.on_yank()
	end
})


-- Format buffer on save
local au_fs = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePre"}, {
	desc = "[lsp] format on save",
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue" },
	group = au_fs,
	callback = function()
		vim.cmd("EslintFixAll")
	end
})


-- Because one cannot simply have it too easy sometimes...
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
