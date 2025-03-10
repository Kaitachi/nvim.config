require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"c",
		"comment",
		"go",
		"html",
		"java",
		"json",
		"lua",
		"markdown",
		"query",
		"svelte",
		"vim",
		"vimdoc",
		"yaml"
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- nvim-treesitter-context
vim.api.nvim_set_hl(0, "TreesitterContext", { ctermbg = 239 })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { ctermbg = "White", ctermfg = "DarkGrey" })

-- Remove TODO highlights (using another plugin for this)
vim.api.nvim_set_hl(0, "@comment.todo.comment", { link = "TodoBgTODO" })

