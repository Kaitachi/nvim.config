function ColorMyPencils(color)
	-- Set color scheme for lightline
	vim.g["lightline"] = {
		colorscheme = 'OldHope'
	}

	-- Set color scheme options
	vim.g["edge_style"] = 'neon'

	-- Use `:echo g:colors_name` to show current color scheme
	color = color or "edge"
	vim.cmd.colorscheme(color)

	-- Show text without background colors
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- Show whitespaces without background colors
	vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermfg = 237 })

	-- Distinctive EOB
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermfg = 202 })

	-- Visual
	--vim.api.nvim_set_hl(0, "Visual", { ctermbg = 24, ctermfg = 231 })
end

ColorMyPencils()

