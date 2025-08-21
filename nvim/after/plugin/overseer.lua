local overseer = require("overseer")

overseer.setup({
	actions = {
		["smart watch"] = {
			desc = "watch & open in sidebar",
			run = function(task)
				task:add_component({ "restart_on_save", paths = { vim.fn.expand("%:p") } })
				task:open_output("vertical")

				local width = vim.api.nvim_win_get_width(0)
				local new_width = width * 2 / 3
				vim.cmd("vertical resize" .. new_width)

				-- TODO: Move cursor to previous window
				vim.cmd("normal! ^WH")
			end,
		}
	}
})

local smart_test_action = {
	name = "smart test",
	builder = function(params)
		return {
			cmd = "make test ARGS='--lf'",
			name = "smart test",
		}
	end,
}

overseer.register_template(smart_test_action)

vim.keymap.set('n', '<F9>', overseer.toggle, { desc = "[Terminal] Toggle Overseer" })
vim.keymap.set('n', '<F11>', overseer.run_template, { desc = "[Terminal] Run Overseer Template" })

-- Set up smart watch action (watch & set to sidebar)
vim.api.nvim_create_user_command("OverseerSmartWatch", function(opts)
	overseer.run_template({ name = "smart test" }, function(task)
		if task == nil then
			vim.api.nvim_echo({ { "No task found", "WarningMsg" } }, false, {})
			return
		end

		overseer.run_action(task, "smart watch")
	end)
end, {})
