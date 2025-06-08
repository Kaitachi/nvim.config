local wk = require("which-key")

wk.setup({
	preset = "helix",
	icons = {
		rules = {
			{ pattern = "go to", icon = " ", color = "black" },
			{ pattern = "rename", icon = "󰑕 ", color = "black" },
			{ pattern = "github", icon = " ", color = "grey" },
			{ pattern = "git", icon = " ", color = "orange" }
		}
	}
})
