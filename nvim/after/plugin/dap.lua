-- See :h dap.txt for more information.
local dap = require('dap')
local ui = require('dapui')

require("dapui").setup({
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.25
		}, {
			id = "breakpoints",
			size = 0.25
		}, {
			id = "stacks",
			size = 0.25
		}, {
			id = "watches",
			size = 0.25
		} },
		position = "right",
		size = 40
	}, {
		elements = { {
			id = "repl",
			size = 0.5
		}, {
			id = "console",
			size = 0.5
		} },
		position = "bottom",
		size = 10
	} }
})

-- Keybinds
-- TODO: Attach these on some condition...
-- vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
-- vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
-- vim.keymap.set("n", "<leader><F1>", ui.toggle)
--
-- vim.keymap.set("n", "<F1>", dap.continue)
-- vim.keymap.set("n", "<F2>", dap.step_into)
-- vim.keymap.set("n", "<F3>", dap.step_over)
-- vim.keymap.set("n", "<F4>", dap.step_out)
-- vim.keymap.set("n", "<F5>", dap.step_back)
-- vim.keymap.set("n", "<F13>", dap.restart)

-- Fancy dap-ui integration
dap.listeners.before.attach.dapui_config = function()
	ui.open()
end

dap.listeners.before.launch.dapui_config = function()
	ui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

-- Golang Adapter
-- Configured with leoluz/nvim-dap-go plugin
require("dap-go").setup()

-- dap.adapters.delve = function(callback, config)
--     if config.mode == 'remote' and config.request == 'attach' then
--         callback({
--             type = 'server',
--             host = config.host or '127.0.0.1',
--             port = config.port or '38697'
--         })
--     else
--         callback({
--             type = 'server',
--             port = '${port}',
--             executable = {
--                 command = 'dlv',
--                 args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
--                 detached = vim.fn.has("win32") == 0,
--             }
--         })
--     end
-- end
--
--
-- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
--   {
--     type = "delve",
--     name = "Debug",
--     request = "launch",
--     program = "${file}"
--   },
--   {
--     type = "delve",
--     name = "Debug test", -- configuration for debugging test files
--     request = "launch",
--     mode = "test",
--     program = "${file}"
--   },
--   -- works with go.mod packages and sub packages
--   {
--     type = "delve",
--     name = "Debug test (go.mod)",
--     request = "launch",
--     mode = "test",
--     program = "./${relativeFileDirname}"
--   }
-- }
--dap.adapters.delve = {
--	type = "server",
--	host = "127.0.0.1",
--	port = 38697,
--}
