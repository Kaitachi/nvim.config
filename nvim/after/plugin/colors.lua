function ColorMyPencils(color)
	-- Set color scheme for lightline
	vim.g["lightline"] = {
		colorscheme = 'OldHope',
		active = {
			left = { { 'mode', 'paste' },
			{ 'gitbranch', 'readonly', 'filename', 'modified' } }
		},
		component_function = {
			gitbranch = 'FugitiveHead'
		}
	}

	-- Set color scheme options
	vim.g["edge_style"] = 'neon'
	vim.g["edge_diagnostic_virtual_text"] = 'highlighted'
	vim.g["edge_menu_selection_background"] = 'green'
	vim.g["edge_float_style"] = 'dim'

	-- Use `:echo g:colors_name` to show current color scheme
	color = color or "edge"

	if vim.cmd.termguicolors then
		-- Set different color scheme for terminals that support it
		color = "edge"
	end

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
	

	-- Custom italics for diagnostics
	highlights = { "VirtualTextError", "VirtualTextWarning", "VirtualTextInfo", "VirtualTextHint", "DiagnosticOk" }
	
	for k, v in pairs(highlights) do
		hl = vim.api.nvim_get_hl(0, { name = v })
		hl["italic"] = true
		vim.api.nvim_set_hl(0, v, hl)
	end
end

ColorMyPencils()

