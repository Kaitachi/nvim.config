-- Enable spelling on text files
local au_sp = vim.api.nvim_create_augroup("sp", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "[spell] Enable spelling on text files",
	pattern = { "markdown", "org", "txt", "tex" },
	group = au_sp,
	callback = function()
		vim.opt_local.spell = true
		vim.bo.spelllang = "en_us"
	end
})

-- autocmd FileType help setlocal nospell
-- TODO: Need to properly make this work on markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "[spell] Disable spelling on help files",
	pattern = { "markdown" },
	group = au_sp,
	callback = function()
		vim.opt_local.spell = false
	end
})


-- Relative number toggle
-- Adapted from Jeff Kreeftmeijer - thank you!
-- https://jeffkreeftmeijer.com/vim-number/#fnr.1
local au_numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	desc = "[rnu] Toggle (on) relative numbers when leaving Insert mode",
	pattern = "*",
	group = au_numbertoggle,
	callback = function()
		vim.api.nvim_command("if &nu && mode() != 'i' | set rnu | endif")
	end
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	desc = "[rnu] Toggle (off) relative numbers when entering Insert mode",
	pattern = "*",
	group = au_numbertoggle,
	callback = function()
		vim.api.nvim_command("if &nu | set nornu | endif")
	end
})


-- Diagnostic toggle
local au_diagnostictoggle = vim.api.nvim_create_augroup("diagnostictoggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	desc = "[diag] Toggle (on) diagnostic virtual text when leaving Insert mode",
	pattern = "*",
	group = au_diagnostictoggle,
	callback = function()
		vim.diagnostic.config({ virtual_text = true })
	end
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	desc = "[diag] Toggle (off) diagnostic virtual text when entering Insert mode",
	pattern = "*",
	group = au_diagnostictoggle,
	callback = function()
		vim.diagnostic.config({ virtual_text = false })
	end
})


-- Highlight text that is being yanked
local au_hy = vim.api.nvim_create_augroup("hy", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	desc = "[y] Highlight when yanking text",
	group = au_hy,
	callback = function()
		vim.highlight.on_yank()
	end
})


-- Format buffer on save
local au_fs = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	desc = "[lsp] format on save",
	group = au_fs,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		if client:supports_method('textDocument/completion') then
			-- Enable autocomplete
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			vim.keymap.set("i", "<M-CR>", "<C-x><C-o>")
		end

		vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
			buffer = args.buf,
			callback = function()
				if client:supports_method('textDocument/formatting') then
					if client.name == "eslint" then
						-- Use eslint to fix Lint issues on save
						vim.cmd("LspEslintFixAll")
					elseif client.name == "vue_ls" then
						-- vue_ls doesn't behave nicely when paired up with eslint,
						-- so we won't set any buffer write actions for it
					else
						-- Format file on save (default behavior)
						vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
					end
				end
			end,
		})
	end
})


-- Add Diagnostics to localqflist
-- Adapted from Rafaelleru - thank you!
-- https://rafaelleru.github.io/blog/quickfix-autocomands/
local au_lq = vim.api.nvim_create_augroup("lsp_send_to_loclist", { clear = true })
vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
	desc = "[lsp] Add diagnostics to loclist on change",
	group = au_lq,
	callback = function()
		vim.diagnostic.setloclist({ open = false, severity = { min = vim.diagnostic.severity.WARN } })

		vim.cmd("call lightline#update()")
	end
})


-- Because one cannot simply have it too easy sometimes...
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
