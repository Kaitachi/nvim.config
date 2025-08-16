local comments = require("todo-comments")

comments.setup({
	keywords = {
		MARK = { icon = "󱋜", color = "error", signs = true },
	},
	highlight = {
		-- TODO: Case-insensitive keyword search
		-- pattern = [[\c.*<(KEYWORDS)\s*:]],
	},
})

local nord_palette = vim.fn.NordPalette()

local bg
local fg = 6

-- Red
-- FIX: sample fix string
bg = 11
vim.api.nvim_set_hl(0, "TodoSignFIX", { fg = nord_palette["nord" .. bg], ctermfg = 1 })
vim.api.nvim_set_hl(0, "TodoFgFIX", { fg = nord_palette["nord" .. bg], ctermfg = 1 })
vim.api.nvim_set_hl(0, "TodoBgFIX",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 1, ctermfg = 7, bold = true })

-- Orange
-- TODO: sample todo string
bg = 12
vim.api.nvim_set_hl(0, "TodoSignTODO", { fg = nord_palette["nord" .. bg], ctermfg = 12 })
vim.api.nvim_set_hl(0, "TodoFgTODO", { fg = nord_palette["nord" .. bg], ctermfg = 12 })
vim.api.nvim_set_hl(0, "TodoBgTODO",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 12, ctermfg = 7, bold = true })

-- Yellow
-- WARN: sample warn string
bg = 13
vim.api.nvim_set_hl(0, "TodoSignWARN", { fg = nord_palette["nord" .. bg], ctermfg = 3 })
vim.api.nvim_set_hl(0, "TodoFgWARN", { fg = nord_palette["nord" .. bg], ctermfg = 3 })
vim.api.nvim_set_hl(0, "TodoBgWARN",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 3, ctermfg = 7, bold = true })

-- Green
-- NOTE: sample note string
bg = 14
vim.api.nvim_set_hl(0, "TodoSignNOTE", { fg = nord_palette["nord" .. bg], ctermfg = 2 })
vim.api.nvim_set_hl(0, "TodoFgNOTE", { fg = nord_palette["nord" .. bg], ctermfg = 2 })
vim.api.nvim_set_hl(0, "TodoBgNOTE",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 2, ctermfg = 7, bold = true })

-- Cyan
-- MARK: sample mark string
bg = 8
vim.api.nvim_set_hl(0, "TodoSignMARK", { fg = nord_palette["nord" .. bg], ctermfg = 6 })
vim.api.nvim_set_hl(0, "TodoFgMARK", { fg = nord_palette["nord" .. bg], ctermfg = 6 })
vim.api.nvim_set_hl(0, "TodoBgMARK",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 6, ctermfg = 7, bold = true })

-- Blue
-- HACK: sample hack string
bg = 10
vim.api.nvim_set_hl(0, "TodoSignHACK", { fg = nord_palette["nord" .. bg], ctermfg = 4 })
vim.api.nvim_set_hl(0, "TodoFgHACK", { fg = nord_palette["nord" .. bg], ctermfg = 4 })
vim.api.nvim_set_hl(0, "TodoBgHACK",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 4, ctermfg = 7, bold = true })

-- Violet
-- PERF: sample perf string
bg = 15
vim.api.nvim_set_hl(0, "TodoSignPERF", { fg = nord_palette["nord" .. bg], ctermfg = 5 })
vim.api.nvim_set_hl(0, "TodoFgPERF", { fg = nord_palette["nord" .. bg], ctermfg = 5 })
vim.api.nvim_set_hl(0, "TodoBgPERF",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 5, ctermfg = 7, bold = true })

-- Gray
-- TEST: sample test string
bg = 5
fg = 3
vim.api.nvim_set_hl(0, "TodoSignTEST", { fg = nord_palette["nord" .. bg], ctermfg = 8 })
vim.api.nvim_set_hl(0, "TodoFgTEST", { fg = nord_palette["nord" .. bg], ctermfg = 8 })
vim.api.nvim_set_hl(0, "TodoBgTEST",
	{ bg = nord_palette["nord" .. bg], fg = nord_palette["nord" .. fg], ctermbg = 8, ctermfg = 7, bold = true })
