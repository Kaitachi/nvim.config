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
		vim.keymap.set("n", "<S-up>", function() vim.diagnostic.jump({ count = -1 }) end, opts)
		vim.keymap.set("n", "<S-down>", function() vim.diagnostic.jump({ count = 1 }) end, opts)
		vim.keymap.set("n", "M", function() vim.diagnostic.open_float({ border = 'rounded' }) end, opts)

		-- LSP keymaps
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<C-l>', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, opts)
	end,
})
