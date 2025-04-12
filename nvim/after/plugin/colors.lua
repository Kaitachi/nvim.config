function ColorMyPencils(color)
	-- Set lightline options
	vim.g["lightline"] = require("after.plugin.lightline")

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


	-- Custom italics for diagnostics
	local highlights_diagnostics = { "VirtualTextError", "VirtualTextWarning", "VirtualTextInfo", "VirtualTextHint", "DiagnosticOk" }

	for _, v in pairs(highlights_diagnostics) do
		local hl_diag = vim.api.nvim_get_hl(0, { name = v })
		hl_diag["italic"] = true
		if v == "VirtualTextWarning" then
			hl_diag["ctermbg"] = 3
			hl_diag["ctermfg"] = 15
		end
		vim.api.nvim_set_hl(0, v, hl_diag)
	end


	-- Custom colors for lightline errors
	local highlight_lightline_errors = {
		"LightlineLeft_normal_error",
		"LightlineLeft_insert_error",
		"LightlineLeft_replace_error",
		"LightlineLeft_visual_error",
		"LightlineLeft_command_error",
		"LightlineLeft_inactive_error",
		"LightlineLeft_select_error",
		"LightlineLeft_terminal_error",
	}

	for _, v in pairs(highlight_lightline_errors) do
		vim.api.nvim_set_hl(0, v, { link = "VirtualTextError" })
	end
end

ColorMyPencils()

