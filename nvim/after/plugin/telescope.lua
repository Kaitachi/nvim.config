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
	},
	pickers = {
		oldfiles = {
			cwd_only = true,
		}
	},
})

telescope.load_extension('harpoon')

-- Telescope Search
vim.keymap.set('n', '<leader><leader>', builtin.builtin, { desc = "[Telescope] Show Telescope commands" })
vim.keymap.set('n', '<leader>P', builtin.planets, { desc = "[Telescope] Planets" })

-- Vim Search
vim.keymap.set('n', '<c-bslash>H', builtin.help_tags, { desc = "[Telescope] Search Help" })
vim.keymap.set('n', '<c-bslash>k', builtin.keymaps, { desc = "[Telescope] Show Vim Keymaps" })
vim.keymap.set('n', '<c-bslash>c', builtin.commands, { desc = "[Telescope] Show Vim Commands" })
vim.keymap.set('n', '<c-bslash>b', builtin.buffers, { desc = "[Telescope] Show Vim Buffers" })
vim.keymap.set('n', '<c-bslash>r', builtin.registers, { desc = "[Telescope] Show Vim Registers" })

-- File Search
vim.keymap.set('n', '<leader>=', '<cmd>Telescope find_files hidden=true<CR>',
	{ desc = "[Telescope] Fuzzy-find project file names" })
vim.keymap.set('n', '+', builtin.oldfiles, { desc = "[Telescope] Fuzzy-find recent file names" })
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = "[Telescope] Fuzzy-find text" })

-- Git Commands
vim.keymap.set('n', '<F12>', function()
	local opts = require('telescope.themes').get_ivy({})
	builtin.git_branches(opts)
end, { desc = "[Telescope] Show Git branches" })

-- Buffer Search
vim.keymap.set('n', '<leader>M', builtin.marks, { desc = "[Telescope] Show Vim Marks" })

-- LSP
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "[Telescope] Show LSP References", nowait = true })
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, { desc = "[Telescope] Show LSP Type Definitions" })
vim.keymap.set('n', '<leader>S', builtin.lsp_document_symbols, { desc = "[Telescope] Show LSP Document Symbols" })
vim.keymap.set('n', '<leader>W', builtin.lsp_workspace_symbols, { desc = "[Telescope] Show LSP Workspace Symbols" })
