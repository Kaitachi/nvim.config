local mason = require("mason")
local lspconfig = require("mason-lspconfig")

mason.setup({
	ui = {
		border = "rounded"
	}
})
lspconfig.setup()
