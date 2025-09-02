local lualine = require("lualine")

-- Custom theme based on codedark
local colors = {
	gray     = "#3C3C3C",
	lightred = "#D16969",
	blue     = "#569CD6",
	black    = "#262626",
	white    = "#D4D4D4",
	green    = "#608B4E",
	orange   = "#EF7C2A",
}

local custom_codedark = {
	normal = {
		a = { fg = colors.black, bg = colors.blue, gui = "bold" },
		b = { fg = colors.blue, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
	},
	insert = {
		a = { fg = colors.black, bg = colors.green, gui = "bold" },
		b = { fg = colors.green, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
	},
	visual = {
		a = { fg = colors.black, bg = colors.orange, gui = "bold" },
		b = { fg = colors.orange, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
	},
	replace = {
		a = { fg = colors.black, bg = colors.lightred, gui = "bold" },
		b = { fg = colors.lightred, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
	},
	terminal = {
		a = { fg = colors.green, bg = colors.black, gui = "bold" },
		b = { fg = colors.black, bg = colors.green },
		c = { fg = colors.white, bg = colors.green },
	},
	command = {
		a = { fg = colors.blue, bg = colors.black, gui = "bold" },
		b = { fg = colors.black, bg = colors.blue },
		c = { fg = colors.white, bg = colors.blue },
	},
	inactive = {
		a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
		b = { fg = colors.black, bg = colors.blue },
	},
}


lualine.setup({
	options = {
		theme = custom_codedark
	}
})
