local npm_path = vim.fn.system { "which", "npm" }:gsub("bin/npm\n", "")
local vue_typescript_plugin_path = npm_path .. "lib/node_modules/@vue/typescript-plugin"

return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_typescript_plugin_path,
				language = { "javascript", "typescript", "vue" },
			},
		},
	},
}
