function ColorMyPencils(color)
	-- Use `:echo g:colors_name` to show current color scheme
	color = color or "spacecamp"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd.AirlineTheme("tomorrow")
end

ColorMyPencils()

