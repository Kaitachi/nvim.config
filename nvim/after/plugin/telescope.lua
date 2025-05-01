local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup({
	defaults = {
		mappings = {
			i = {
				['<C-p>'] = require('telescope.actions.layout').toggle_preview
			}
		},
		file_ignore_patterns = {
			"node_modules",
			"package%-lock.json",
			".git"
		}
	}
})

telescope.load_extension('harpoon')

-- Telescope Search
vim.keymap.set('n', '<leader><leader>', builtin.builtin, { desc = "Show Telescope commands" })
vim.keymap.set('n', '<leader>P', builtin.planets, { desc = "Telescope planets" })

-- Vim Search
vim.keymap.set('n', '<leader>H', builtin.help_tags, { desc = "Show Help" })
vim.keymap.set('n', '<c-bslash><c-k>', builtin.keymaps, { desc = "Show Vim Keymaps" })
vim.keymap.set('n', '<c-bslash><c-c>', builtin.commands, { desc = "Show Vim Commands" })
vim.keymap.set('n', '<c-bslash><c-b>', builtin.buffers, { desc = "Show Vim Buffers" })
vim.keymap.set('n', '<c-bslash><c-r>', builtin.registers, { desc = "Show Vim Registers" })

-- File Search
vim.keymap.set('n', '<leader>=', '<cmd>Telescope find_files hidden=true<CR>', { desc = "Telescope fuzzy-find project file names" })
vim.keymap.set('n', '+', builtin.oldfiles, { desc = "Telescope fuzzy-find recent file names" })
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = "Telescope fuzzy-find text" })

-- Git Commands
vim.keymap.set('n', '<F12>', function() builtin.git_branches {
	layout_strategy = "vertical"
} end, { desc = "[macOS] Telescope show Git branches" })
vim.keymap.set('n', '<F22>', function() builtin.git_branches {
	layout_strategy = "vertical"
} end, { desc = "[Linux] Telescope show Git branches" })

-- Buffer Search
vim.keymap.set('n', '<leader>M', builtin.marks, { desc = "Show Vim Marks" })

-- LSP
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "Show LSP Definition" })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Show LSP References" })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "Show LSP Implementations" })
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, { desc = "Show LSP Type Definitions" })
vim.keymap.set('n', '<leader>S', builtin.lsp_document_symbols, { desc = "Show LSP Document Symbols" })
vim.keymap.set('n', '<leader>W', builtin.lsp_dynamic_workspace_symbols, { desc = "Show LSP Workspace Symbols" })

