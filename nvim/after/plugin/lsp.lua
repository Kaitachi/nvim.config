-- Show diagnostics in virtual text
vim.diagnostic.config({
	virtual_text = true
})


-- Enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local opts = { buffer = event.buf }

		-- Diagnostic keymaps
		vim.keymap.set("n", "<S-up>", function() vim.diagnostic.jump({ count = -1 }) end,
			{ unpack(opts), desc = "[Diagnostic] Cycle backwards through diagnostics" })
		vim.keymap.set("n", "<S-down>", function() vim.diagnostic.jump({ count = 1 }) end,
			{ unpack(opts), desc = "[Diagnostic] Cycle fowards through diagnostics" })
		vim.keymap.set("n", "M", function() vim.diagnostic.open_float({ border = 'rounded' }) end,
			{ unpack(opts), desc = "[Diagnostic] Show diagnostics" })

		-- LSP keymaps
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end,
			{ unpack(opts), desc = "[Code] Hover word" })
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { unpack(opts), desc = "[Code] Go to Definition" })
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { unpack(opts), desc = "[Code] Go to Declaration" })
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { unpack(opts), desc = "[Code] Go to Implementation" })
		vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { unpack(opts), desc = "[Code] Go to Type Definition" })
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { unpack(opts), desc = "[Code] Rename" })
		vim.keymap.set('n', '<M-CR>', vim.lsp.buf.code_action, { unpack(opts), desc = "[Code] Show Code Actions" })
		vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end,
			{ unpack(opts), desc = "[Code] Show Signature Help" })
	end,
})
