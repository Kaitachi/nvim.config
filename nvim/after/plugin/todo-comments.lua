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

local nord_palette = vim.fn['NordPalette']()
local nord_fg = nord_palette["nord6"]

-- Red
-- FIX: sample fix string
vim.api.nvim_set_hl(0, "TodoSignFIX", { fg = nord_palette["nord11"], ctermfg = 11 })
vim.api.nvim_set_hl(0, "TodoFgFIX", { fg = nord_palette["nord11"], ctermfg = 11 })
vim.api.nvim_set_hl(0, "TodoBgFIX", { bg = nord_palette["nord11"], fg = nord_fg, ctermbg = 11, ctermfg = 6, bold = true })

-- Orange
-- TODO: sample todo string
vim.api.nvim_set_hl(0, "TodoSignTODO", { fg = nord_palette["nord12"], ctermfg = 12 })
vim.api.nvim_set_hl(0, "TodoFgTODO", { fg = nord_palette["nord12"], ctermfg = 12 })
vim.api.nvim_set_hl(0, "TodoBgTODO",
	{ bg = nord_palette["nord12"], fg = nord_fg, ctermbg = 12, ctermfg = 6, bold = true })

-- Yellow
-- WARN: sample warn string
vim.api.nvim_set_hl(0, "TodoSignWARN", { fg = nord_palette["nord13"], ctermfg = 13 })
vim.api.nvim_set_hl(0, "TodoFgWARN", { fg = nord_palette["nord13"], ctermfg = 13 })
vim.api.nvim_set_hl(0, "TodoBgWARN",
	{ bg = nord_palette["nord13"], fg = nord_fg, ctermbg = 13, ctermfg = 6, bold = true })

-- Green
-- NOTE: sample note string
vim.api.nvim_set_hl(0, "TodoSignNOTE", { fg = nord_palette["nord14"], ctermfg = 14 })
vim.api.nvim_set_hl(0, "TodoFgNOTE", { fg = nord_palette["nord14"], ctermfg = 14 })
vim.api.nvim_set_hl(0, "TodoBgNOTE",
	{ bg = nord_palette["nord14"], fg = nord_fg, ctermbg = 14, ctermfg = 6, bold = true })

-- Cyan
-- MARK: sample mark string
vim.api.nvim_set_hl(0, "TodoSignMARK", { fg = nord_palette["nord8"], ctermfg = 8 })
vim.api.nvim_set_hl(0, "TodoFgMARK", { fg = nord_palette["nord8"], ctermfg = 8 })
vim.api.nvim_set_hl(0, "TodoBgMARK", { bg = nord_palette["nord8"], fg = nord_fg, ctermbg = 8, ctermfg = 6, bold = true })

-- Blue
-- HACK: sample hack string
vim.api.nvim_set_hl(0, "TodoSignHACK", { fg = nord_palette["nord10"], ctermfg = 10 })
vim.api.nvim_set_hl(0, "TodoFgHACK", { fg = nord_palette["nord10"], ctermfg = 10 })
vim.api.nvim_set_hl(0, "TodoBgHACK",
	{ bg = nord_palette["nord10"], fg = nord_fg, ctermbg = 10, ctermfg = 6, bold = true })

-- Violet
-- PERF: sample perf string
vim.api.nvim_set_hl(0, "TodoSignPERF", { fg = nord_palette["nord15"], ctermfg = 15 })
vim.api.nvim_set_hl(0, "TodoFgPERF", { fg = nord_palette["nord15"], ctermfg = 15 })
vim.api.nvim_set_hl(0, "TodoBgPERF",
	{ bg = nord_palette["nord15"], fg = nord_fg, ctermbg = 15, ctermfg = 6, bold = true })

-- Brown
-- TEST: sample test string
vim.api.nvim_set_hl(0, "TodoSignTEST", { fg = nord_palette["nord3"], ctermfg = 3 })
vim.api.nvim_set_hl(0, "TodoFgTEST", { fg = nord_palette["nord3"], ctermfg = 3 })
vim.api.nvim_set_hl(0, "TodoBgTEST", { bg = nord_palette["nord3"], fg = nord_fg, ctermbg = 3, ctermfg = 6, bold = true })
