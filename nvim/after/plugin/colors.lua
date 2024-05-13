function ColorMyPencils(color)
	-- Use `:echo g:colors_name` to show current color scheme
	color = color or "spacecamp"
	vim.cmd.colorscheme(color)

	-- Show text without background colors
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- Show whitespaces without background colors
	vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermfg = 237 })

	-- Distinctive EOB
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermfg = 202 })

	vim.cmd.AirlineTheme("tomorrow")
end

ColorMyPencils()

