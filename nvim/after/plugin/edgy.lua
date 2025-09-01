local edgy = require("edgy")

local make_test_cmd = "make test ARGS='--lf'"

local create_term = function(args)
	local opts = {
		interactive = false,
		win = {
			position = "right",
		},
	}

	if args then
		-- Function called from file write; let's kill the current process
		local current_term = require("snacks").terminal.get(make_test_cmd, { create = false })
		if current_term then
			vim.cmd('bd! ' .. current_term.buf)
		end
	end

	local new_term = require("snacks").terminal.toggle(make_test_cmd, opts)
	vim.b[new_term.buf].term_title = make_test_cmd
end

edgy.setup({
	exit_when_last = true,
	right = {
		-- snacks_terminal at the right with a width of 33% of the screen
		{
			ft = "snacks_terminal",
			title = "%{b:snacks_terminal.id}: term://%{b:term_title}",
			size = { width = 0.33 },
			pinned = true,
			open = function()
				create_term()

				vim.api.nvim_create_autocmd({ "BufWritePost" }, {
					pattern = vim.loop.cwd() .. "/*",
					callback = create_term,
				})
			end,
			filter = function(buf, win)
				return vim.api.nvim_buf_get_name(buf):find(":" .. make_test_cmd:gsub("-", "--")) ~= nil
			end,
		},
	}
})

vim.keymap.set('n', '<F9>', edgy.toggle, { desc = "[Edgy] Toggle Edgy" })
