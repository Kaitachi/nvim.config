local macos = {
	fs = {
		home = os.getenv("HOME"),
		projects = (os.getenv("HOME") or "") .."/Developer",
	},
	cmd = {
		open_finder = "open ..",
	},
}

local windows = {
	fs = {
		home = os.getenv("UserProfile"),
		projects = (os.getenv("UserProfile") or "") .. "/Projects",
	},
	cmd = {
		open_finder = "start ..",
	},
}

-- Operating System Mappings
local op_sys = {
	Darwin = macos,
	Linux = macos,
	Windows_NT = windows
}

-- print("macunix: " .. vim.fn.has("macunix"))
-- print(vim.loop.os_uname().sysname)

return op_sys[vim.loop.os_uname().sysname]

