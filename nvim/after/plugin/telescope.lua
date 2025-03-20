local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"package%-lock.json",
			".git"
		}
	}
})

telescope.load_extension('harpoon')

-- Telescope Search
vim.keymap.set('n', '<leader><leader>', builtin.builtin, {})
vim.keymap.set('n', '<leader>P', builtin.planets, {})

-- Vim Search
vim.keymap.set('n', '<leader>H', builtin.help_tags, {})
vim.keymap.set('n', '<c-bslash><c-k>', builtin.keymaps, {})
vim.keymap.set('n', '<c-bslash><c-c>', builtin.commands, {})
vim.keymap.set('n', '<c-bslash><c-b>', builtin.buffers, {})
vim.keymap.set('n', '<c-bslash><c-r>', builtin.registers, {})

-- File Search
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>=', '<cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})

-- Buffer Search
vim.keymap.set('n', '<leader>M', builtin.marks, {})

-- LSP
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>S', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>W', builtin.lsp_dynamic_workspace_symbols, {})

