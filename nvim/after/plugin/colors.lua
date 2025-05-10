function ColorMyPencils(color)
	-- TODO: Wish this would exist elsewhere...
	-- Set lightline options
	vim.g["lightline"] = {
		colorscheme = 'custom',
		active = {
			left = {
				{ 'mode', 'paste' },
				{ 'gitdetachedhead', 'gitbranch' },
				{ 'readonly', 'relpath', 'modified' }
			},
			right = {
				{ 'lineinfo' },
				{ 'percent', 'diagnosticwarns', 'diagnosticerrs' },
				{ 'fileformat', 'fileencoding', 'filetype' }
			}
		},
		component_function = {
			gitbranch = 'LightlineGitCurrentBranch',
			relpath = 'LightlineCurrentRelativePath'
		},
		component_expand = {
			gitdetachedhead = 'LightlineGitDetachedHead',
			diagnosticwarns = 'LightlineDiagnosticWarns',
			diagnosticerrs = 'LightlineDiagnosticErrors',
		},
		component_type = {
			gitdetachedhead = 'error',
			diagnosticwarns = 'warning',
			diagnosticerrs = 'error'
		},
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
end

ColorMyPencils()

