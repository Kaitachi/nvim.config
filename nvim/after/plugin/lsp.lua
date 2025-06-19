local lspkind = require('lspkind')

-- Show diagnostics in virtual text
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	update_in_insert = false,
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅚 ',
			[vim.diagnostic.severity.WARN] = '󰀪 ',
			[vim.diagnostic.severity.INFO] = '󰋽 ',
			[vim.diagnostic.severity.HINT] = '󰌶 ',
		},
	},
})


-- Enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		--#region Bind LSP Keymaps
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
			{ unpack(opts), desc = "Hover word" })
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { unpack(opts), desc = "Go to Definition" })
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { unpack(opts), desc = "Go to Declaration" })
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { unpack(opts), desc = "Go to Implementation" })
		vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { unpack(opts), desc = "Go to Type Definition" })
		vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, { unpack(opts), desc = "Rename" })
		vim.keymap.set('n', '<space>h', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end,
			{ unpack(opts), desc = "Show Signature Help" })
		vim.keymap.set('n', '<C-x><C-o>', vim.lsp.buf.code_action,
			{ unpack(opts), desc = "Show Code Actions" })
		--#endregion

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if not client then
			return
		end


		--#region Highlight when cursor is idle
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
				end,
			})
		end
		--#endregion

		--#region Enable Completion on current buffer
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion, event.buf) then
			-- Enable autocomplete
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
			vim.keymap.set("i", "<M-CR>", "<C-x><C-o>", { desc = "[lsp] Show Completion Options" })
		end
		--#endregion

		--#region Inlay Hints
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			vim.keymap.set("n", '<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, { desc = '[T]oggle Inlay [H]ints' })
		end
		--#endregion

		--#region Format On Save
		if client.name == "vue_ls" then
			-- NOTE: vue_ls doesn't behave nicely when paired up with eslint,
			-- so we won't set any buffer write actions for it
			return
		end

		vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
			buffer = event.buf,
			callback = function()
				if client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting, event.buf) then
					if client.name == "eslint" then
						-- Use eslint to fix Lint issues on save
						vim.cmd("LspEslintFixAll")
					else
						-- Format file on save (default behavior)
						vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
					end
				end
			end,
		})
		--#endregion
	end
})


lspkind.setup({
	mode = 'symbol_text',
})
