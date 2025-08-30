local comments = require("todo-comments")

comments.setup({
	keywords = {
		MARK = { icon = "󱋜", signs = true },
	},
	highlight = {
		-- TODO: Case-insensitive keyword search
		-- pattern = [[\c\b(KEYWORDS):]],
	},
})
