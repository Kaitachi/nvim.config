local telescope = require("telescope")
local builtin = require('telescope.builtin')
local strings = require('plenary.strings')

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
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_cursor {
				-- even more opts
			},
			specific_opts = {
				["overseer_template"] = {
					make_indexed = function(items)
						local indexed_items = {}
						local widths = {
							idx = 0,
							command_title = 0,
						}
						for idx, item in ipairs(items) do
							local entry = {
								idx = idx,
								["add"] = {
									command_title = item.name,
								},
								text = item,
							}
							table.insert(indexed_items, entry)
							widths.idx = math.max(widths.idx, strings.strdisplaywidth(entry.idx))
							widths.command_title = math.max(widths.command_title,
								strings.strdisplaywidth(entry.add["command_title"]))
						end
						return indexed_items, widths
					end,
					make_displayer = function(widths)
						return require("telescope.pickers.entry_display").create {
							separator = " ",
							items = {
								{ width = widths.idx + 1 }, -- +1 for ":" suffix
								{ width = widths.command_title },
							},
						}
					end,
					make_display = function(displayer)
						return function(e)
							return displayer {
								{ e.value.idx .. ":",          "TelescopePromptPrefix" },
								{ e.value.add["command_title"] },
							}
						end
					end,
					make_ordinal = function(e)
						return e.idx .. e.add["command_title"]
					end,
				},
			}
		}
	}
})

-- HACK: Useful to let us know what kind we want to use for ui-select options
-- vim.ui.select = function(items, opts, on_choice)
-- 	print(opts.kind)
-- end

telescope.load_extension('ui-select')
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
