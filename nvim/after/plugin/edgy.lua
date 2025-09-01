local edgy = require("edgy")

local make_test_buf_name = "#toggleterm#9"

local termexec_make_test = function()
	-- if false then
	-- 	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
	-- 		if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_get_option_value("buftype", { buf = bufnr }) ~= "terminal" then
	-- 			goto continue
	-- 		end
	--
	-- 		local buf_name = vim.api.nvim_buf_get_name(bufnr)
	--
	-- 		if not string.find(buf_name, make_test_buf_name) then
	-- 			goto continue
	-- 		end
	--
	-- 		-- FIXME: If this is good for anything, here we have our buffer
	-- 		-- dd("found " .. buf_name)
	-- 		-- vim.api.nvim_buf_call(bufnr, function()
	-- 		-- 	vim.cmd("norm i<C-c><C-d>")
	-- 		-- end)
	--
	-- 		::continue::
	-- 	end
	-- end

	vim.cmd("9 TermExec cmd='clear; make test ARGS=--lf' name='make test'")
end

edgy.setup({
	exit_when_last = true,
	right = {
		-- toggleterm at the right with a width of 33% of the screen
		{
			ft = "toggleterm",
			title = "[TERMINAL] - `make test`",
			size = { width = 0.33 },
			pinned = true,
			open = function()
				termexec_make_test()

				-- Makes this command watch project files
				-- (re-execute tests on file save)
				vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
					pattern = vim.loop.cwd() .. "/*",
					callback = termexec_make_test,
				})
			end,
			filter = function(buf, win)
				-- Ensure to only get buffer with our `make test` command
				local full_name = vim.api.nvim_buf_get_name(buf)
				return string.find(full_name, make_test_buf_name)
			end,
		},
		{
			ft = "toggleterm",
			title = "[TERMINAL]",
			size = { width = 0.33 },
			-- exclude floating windows
			filter = function(buf, win)
				return vim.api.nvim_win_get_config(win).relative == ""
			end,
		},
	}
})

vim.keymap.set('n', '<F9>', edgy.toggle, { desc = "[Edgy] Toggle Edgy" })
