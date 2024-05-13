local comments = require("todo-comments")

comments.setup({
	keywords = {
		MARK = { icon = "󱋜", color = "error", signs = true },
	},
})

-- So, apparently macOS does not support the color nomenclature used by todo-comments... =(
if not vim.o.termguicolors then
	-- Red
	-- FIX: sample fixme string
	vim.api.nvim_set_hl(0, "TodoSignFIX", { ctermfg = "DarkRed" })
	vim.api.nvim_set_hl(0, "TodoFgFIX", { ctermfg = "DarkRed" })
	vim.api.nvim_set_hl(0, "TodoBgFIX", { ctermbg = "DarkRed", ctermfg = "White", bold = true })

	-- Orange
	-- TODO: sample todo string
	vim.api.nvim_set_hl(0, "TodoSignTODO", { ctermfg = 202 })
	vim.api.nvim_set_hl(0, "TodoFgTODO", { ctermfg = 202 })
	vim.api.nvim_set_hl(0, "TodoBgTODO", { ctermbg = 202, ctermfg = "White", bold = true })

	-- Yellow
	-- WARN: sample warn string
	vim.api.nvim_set_hl(0, "TodoSignWARN", { ctermfg = "DarkYellow" })
	vim.api.nvim_set_hl(0, "TodoFgWARN", { ctermfg = "DarkYellow" })
	vim.api.nvim_set_hl(0, "TodoBgWARN", { ctermbg = "DarkYellow", ctermfg = "White", bold = true })

	-- Green
	-- NOTE: sample note string
	vim.api.nvim_set_hl(0, "TodoSignNOTE", { ctermfg = "DarkGreen" })
	vim.api.nvim_set_hl(0, "TodoFgNOTE", { ctermfg = "DarkGreen" })
	vim.api.nvim_set_hl(0, "TodoBgNOTE", { ctermbg = "DarkGreen", ctermfg = "White", bold = true })

	-- Cyan
	-- MARK: sample mark string
	vim.api.nvim_set_hl(0, "TodoSignMARK", { ctermfg = "Cyan" })
	vim.api.nvim_set_hl(0, "TodoFgMARK", { ctermfg = "Cyan" })
	vim.api.nvim_set_hl(0, "TodoBgMARK", { ctermbg = "Cyan", ctermfg = "White", bold = true })

	-- Blue
	-- HACK: sample hack string
	vim.api.nvim_set_hl(0, "TodoSignHACK", { ctermfg = "DarkBlue" })
	vim.api.nvim_set_hl(0, "TodoFgHACK", { ctermfg = "DarkBlue" })
	vim.api.nvim_set_hl(0, "TodoBgHACK", { ctermbg = "DarkBlue", ctermfg = "White", bold = true })

	-- Violet
	-- PERF: sample perf string
	vim.api.nvim_set_hl(0, "TodoSignPERF", { ctermfg = 53 })
	vim.api.nvim_set_hl(0, "TodoFgPERF", { ctermfg = 53 })
	vim.api.nvim_set_hl(0, "TodoBgPERF", { ctermbg = 53, ctermfg = "White", bold = true })

	-- Brown
	-- TEST: sample test string
	vim.api.nvim_set_hl(0, "TodoSignTEST", { ctermfg = "Brown" })
	vim.api.nvim_set_hl(0, "TodoFgTEST", { ctermfg = "Brown" })
	vim.api.nvim_set_hl(0, "TodoBgTEST", { ctermbg = "Brown", ctermfg = "White", bold = true })
end

