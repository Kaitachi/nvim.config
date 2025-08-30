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
	-- vim.g["edge_style"] = 'neon'
	-- vim.g["edge_diagnostic_virtual_text"] = 'highlighted'
	-- vim.g["edge_menu_selection_background"] = 'green'
	-- vim.g["edge_float_style"] = 'dim'

	color = color or "nord"

	if vim.cmd.termguicolors then
		-- Set different color scheme for terminals that support it
		color = "nord"
	end

	-- Use `:colorscheme` to show current color scheme
	vim.cmd.colorscheme(color)

	local nord = vim.fn.NordPalette()

	-- Mapping from Nord color to term (ansi) color
	local nord_term = {

		-- FIRST ROW
		nord1 = 0, -- GRAYSCALE[2nd, darker]
		nord11 = 1, -- RED
		nord14 = 2, -- GREEN
		nord13 = 3, -- YELLOW
		nord9 = 4, -- BLUESCALE[3rd, pale]
		nord15 = 5, -- PURPLE
		nord8 = 6, -- BLUESCALE[2nd, greenish?]
		nord5 = 7, -- WHITESCALE[2nd, mid]

		-- SECOND ROW
		nord3 = 8, -- GRAYSCALE[4th, lightest]
		nord12 = 15, -- ORANGE
	}

	-- Mapping from ansi color positions to nord/nvim colors
	local ansi_colors = {
		[0] = "nord1",
		[1] = "nord11",
		[2] = "nord14",
		[3] = "nord13",
		[4] = "nord9",
		[5] = "nord15",
		[6] = "nord8",
		[7] = "nord5",
		[8] = "nord3",
		[9] = "NvimDarkRed",
		[10] = "NvimDarkGreen",
		[11] = "NvimDarkYellow",
		[12] = "NvimDarkBlue",
		[13] = "NvimDarkMagenta",
		[14] = "NvimDarkCyan",
		[15] = "nord12",
	}

	if color == "nord" then
		-- For ease of use, let's configure Nord colors to be available
		-- as highlight groups we can easily reference

		for key, value in pairs(nord) do
			-- Set nord color highlight groups
			vim.api.nvim_set_hl(0, key .. "_bg", { bg = value, ctermbg = (nord_term[key] or "none") })
			vim.api.nvim_set_hl(0, key .. "_fg", { fg = value, ctermfg = (nord_term[key] or "none") })
		end

		for i = 0, 15 do
			-- Set ansi color highlight groups
			vim.api.nvim_set_hl(0, "ansi" .. i .. "_bg",
				{ bg = (nord[ansi_colors[i]] or ansi_colors[i]), ctermbg = i })
			vim.api.nvim_set_hl(0, "ansi" .. i .. "_fg",
				{ fg = (nord[ansi_colors[i]] or ansi_colors[i]), ctermfg = i })
		end
	end

	-- Set some convenience highlights
	vim.api.nvim_set_hl(0, "Italic", { italic = true })

	-- Merges n tables onto the target table
	-- target is passed by ref, but is also returned (if desired)
	local function merge(target, ...)
		for _, other in ipairs({ ... }) do
			for key, value in pairs(other) do
				target[key] = value
			end
		end
		return target
	end

	-- Combines n highlights onto the target `hi`
	local function combine_hl(hi, ...)
		local target_hl = vim.api.nvim_get_hl(0, { name = hi })
		while target_hl["link"] do
			-- Determine if our base highlight is a link
			target_hl = vim.api.nvim_get_hl(0, { name = target_hl["link"] })
		end

		for _, other in ipairs({ ... }) do
			merge(target_hl, vim.api.nvim_get_hl(0, { name = other }))
		end

		return target_hl
	end

	-- Assigns to target `hi` the combination of vararg highlights
	local function merge_hl(hi, ...)
		vim.api.nvim_set_hl(0, hi, combine_hl(hi, ...))
	end

	--
	local function set_hl(hi, tbl)
		local result = combine_hl("arst", unpack(tbl))
		vim.api.nvim_set_hl(0, hi, result)
	end

	-- Show whitespaces without background colors
	vim.api.nvim_set_hl(0, "NonText", { ctermfg = 237 })

	-- Distinctive EOB
	vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermfg = 202 })



	-- #region Custom colors for diagnostics
	merge_hl("DiagnosticVirtualTextError", "italic", "ansi9_bg")
	merge_hl("DiagnosticVirtualTextWarn", "italic", "ansi11_bg")
	merge_hl("DiagnosticVirtualTextInfo", "italic", "ansi14_bg")
	merge_hl("DiagnosticVirtualTextHint", "italic", "ansi12_bg")
	merge_hl("DiagnosticVirtualTextOk", "italic", "ansi10_bg")

	-- Code snippet to test some virtual text colors
	-- local target_hl = vim.api.nvim_get_hl(0, { name = "test" })
	-- vim.api.nvim_set_hl(0, "NonText", target_hl)
	-- arst
	-- local arst
	-- #endregion

	-- # region Overwrite more general highlights
	set_hl("NormalFloat", { "nord1_bg" })
	set_hl("Visual", { "ansi10_bg" })
	set_hl("Search", { "ansi8_bg" })
	set_hl("CurSearch", { "ansi11_bg" })
	set_hl("IncSearch", { "italic", "ansi10_bg" })
	set_hl("LineNr", { "nord1_bg" })
	set_hl("SignColumn", { "nord1_bg" })
	-- #endregion

	-- #region Telescope Colors
	set_hl("TelescopeNormal", { "nord1_bg", "nord6_fg" })
	set_hl("TelescopeSelection", { "ansi10_bg" })
	set_hl("TelescopeTitle", { "nord8_fg" })
	set_hl("TelescopePromptCounter", { "nord14_fg" })
	set_hl("TelescopeMatching", { "nord7_fg" })
	set_hl("TelescopeResultsIdentifier", { "nord12_fg" })
	set_hl("TelescopeResultsLineNr", { "nord7_fg" })
	set_hl("TelescopeResultsNumber", { "nord12_fg" })
	set_hl("TelescopeResultsComment", { "nord6_fg" })
	-- #endregion

	-- #region Which-Key Colors
	set_hl("WhichKeyTitle", { "nord1_bg", "nord4_fg" })
	set_hl("WhichKey", { "nord6_fg" })
	set_hl("WhichKeyIconOrange", { "nord12_fg" })
	-- #endregion

	-- #region AI Tool Colors
	set_hl("AISuggestionHighlight", { "nord15_fg", "ansi13_bg", "italic" })
	-- #endregion

	-- #region Treesitter Colors
	-- nvim-treesitter-context
	set_hl("TreesitterContext", { "nord3_bg" })
	set_hl("TreesitterContextLineNumber", { "nord4_bg", "nord2_fg" })
	-- #endregion

	-- #region Todo Colors
	-- Red
	-- FIX: sample fix string
	set_hl("TodoSignFIX", { "nord11_fg" })
	set_hl("TodoFgFIX", { "nord11_fg" })
	set_hl("TodoBgFIX", { "bold", "nord11_bg", "nord6_fg" })

	-- Orange
	-- TODO: sample todo string
	set_hl("TodoSignTODO", { "nord12_fg" })
	set_hl("TodoFgTODO", { "nord12_fg" })
	set_hl("TodoBgTODO", { "bold", "nord12_bg", "nord6_fg" })

	-- Yellow
	-- WARN: sample warn string
	set_hl("TodoSignWARN", { "nord13_fg" })
	set_hl("TodoFgWARN", { "nord13_fg" })
	set_hl("TodoBgWARN", { "bold", "nord13_bg", "nord6_fg" })

	-- Green
	-- NOTE: sample note string
	-- INFO: sample info string
	set_hl("TodoSignNOTE", { "nord14_fg" })
	set_hl("TodoFgNOTE", { "nord14_fg" })
	set_hl("TodoBgNOTE", { "bold", "nord14_bg", "nord6_fg" })

	-- Cyan
	-- MARK: sample mark string
	set_hl("TodoSignMARK", { "nord8_fg" })
	set_hl("TodoFgMARK", { "nord8_fg" })
	set_hl("TodoBgMARK", { "bold", "nord8_bg", "nord6_fg" })

	-- Blue
	-- HACK: sample hack string
	set_hl("TodoSignHACK", { "nord10_fg" })
	set_hl("TodoFgHACK", { "nord10_fg" })
	set_hl("TodoBgHACK", { "bold", "nord10_bg", "nord6_fg" })

	-- Violet
	-- PERF: sample perf string
	set_hl("TodoSignPERF", { "nord15_fg" })
	set_hl("TodoFgPERF", { "nord15_fg" })
	set_hl("TodoBgPERF", { "bold", "nord15_bg", "nord6_fg" })

	-- Gray
	-- TEST: sample test string
	set_hl("TodoSignTEST", { "nord5_fg" })
	set_hl("TodoFgTEST", { "nord5_fg" })
	set_hl("TodoBgTEST", { "bold", "nord5_bg", "nord3_fg" })
	-- #endregion
end

ColorMyPencils()
