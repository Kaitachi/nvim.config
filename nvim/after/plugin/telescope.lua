local telescope = require("telescope")
-- local builtin = require('telescope.builtin')
-- local strings = require("plenary.strings")

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
})

telescope.load_extension('harpoon')
