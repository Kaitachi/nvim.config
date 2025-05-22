local npm_path = vim.fn.system { 'which', 'npm' }:gsub("bin/npm\n", "")

return {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = npm_path .. "lib/node_modules/@vue/language-server",
				languages = { "vue" },
			}
		},
	},
}
