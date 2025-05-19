local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local cmp = require('cmp')


lsp.preset("recommended")
lsp.setup()

-- Add borders to floating windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	-- See :help lsp-zero-keybindings
	callback = function(event)
		local opts = { buffer = event.buf }

		-- Diagnostic keymaps
		vim.keymap.set("n", "<S-up>", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<S-down>", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
})


vim.diagnostic.config({
	virtual_text = true
})


-- Set up autocomplete
cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})


lsp.setup_servers({ "gopls", "tsserver", "svelte" })

if lspconfig.ts_ls ~= nil then
	local npm_path = vim.fn.system { 'which', 'npm' }:gsub("bin/npm\n", "")

	lspconfig.ts_ls.setup({
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = npm_path .. "lib/node_modules/@vue/language-server",
					languages = { "vue" },
				}
			},
		},
	})
end
