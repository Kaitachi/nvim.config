function ColorMyPencils(color)
	-- TODO: Wish this would exist elsewhere...
	-- Set lightline options
	vim.g["lightline"] = {
		colorscheme = 'custom',
		active = {
			left = {
				{ 'mode',            'paste' },
				{ 'gitdetachedhead', 'gitbranch' },
				{ 'readonly',        'relpath',  'modified' }
			},
			right = {
				{ 'lineinfo' },
				{ 'percent',    'diagnosticwarns', 'diagnosticerrs' },
				{ 'fileformat', 'fileencoding',    'filetype' }
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

	color = color or "nord"

	if vim.cmd.termguicolors then
		-- Set different color scheme for terminals that support it
		color = "nord"
	end

	-- Use `:colorscheme` to show current color scheme
	vim.cmd.colorscheme(color)


	-- Show whitespaces without background colors
	vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermfg = 237 })

	-- Distinctive EOB
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermfg = 202 })


	-- #region Custom colors for diagnostics
	local hl_diag_error = vim.api.nvim_get_hl(0, { name = "DiagnosticError" })
	hl_diag_error["italic"] = true
	hl_diag_error["ctermbg"] = 9
	hl_diag_error["bg"] = "NvimDarkRed"
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", hl_diag_error)

	local hl_diag_warn = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" })
	hl_diag_warn["italic"] = true
	hl_diag_warn["ctermbg"] = 11
	hl_diag_warn["bg"] = "NvimDarkYellow"
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", hl_diag_warn)

	local hl_diag_info = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo" })
	hl_diag_info["italic"] = true
	hl_diag_info["ctermbg"] = 14
	hl_diag_info["bg"] = "NvimDarkCyan"
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", hl_diag_info)

	local hl_diag_hint = vim.api.nvim_get_hl(0, { name = "DiagnosticHint" })
	hl_diag_hint["italic"] = true
	hl_diag_hint["ctermbg"] = 12
	hl_diag_hint["bg"] = "NvimDarkBlue"
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", hl_diag_hint)

	local hl_diag_ok = vim.api.nvim_get_hl(0, { name = "DiagnosticOk" })
	hl_diag_ok["italic"] = true
	hl_diag_ok["ctermbg"] = 10
	hl_diag_ok["bg"] = "NvimDarkGreen"
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", hl_diag_ok)
	-- #endregion

	-- # region Overwrite more general highlights
	local nord = vim.fn.NordPalette()

	vim.api.nvim_set_hl(0, "NormalFloat", { bg = nord["nord1"], ctermbg = 1 })
	-- #endregion

	-- #region Telescope Colors
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = nord["nord1"], fg = nord["nord6"], ctermbg = 1 })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { reverse = true })
	vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = nord["nord8"] })
	vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = nord["nord14"] })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = nord["nord7"] })
	vim.api.nvim_set_hl(0, "TelescopeResultsIdentifier", { fg = nord["nord12"] })
	vim.api.nvim_set_hl(0, "TelescopeResultsLineNr", { fg = nord["nord7"] })
	vim.api.nvim_set_hl(0, "TelescopeResultsNumber", { fg = nord["nord12"] })
	vim.api.nvim_set_hl(0, "TelescopeResultsComment", { fg = nord["nord6"] })
	-- #endregion

	-- #region Which-Key Colors
	vim.api.nvim_set_hl(0, "WhichKeyTitle", { bg = nord["nord1"], fg = nord["nord4"] })
	vim.api.nvim_set_hl(0, "WhichKey", { fg = nord["nord6"] })
	vim.api.nvim_set_hl(0, "WhichKeyIconOrange", { fg = nord["nord12"] })
	-- #endregion
end

ColorMyPencils()
