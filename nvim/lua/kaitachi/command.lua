local macos = {
	fs = {
		home = os.getenv("HOME"),
		projects = (os.getenv("HOME") or "") .."/Developer",
	},
	cmd = {
		open_finder = "open ..",
		file_exists = "test -f %s ; expr 1 - $? ", -- { %1 = file to search }
		vimwiki_search = "find %1 -maxdepth %2 %3 -type d -name %4 -print | sed s#%1##", -- { %1 = projectsFolder, %2 = maxDepth, %3 = ignoreFolders, %4 = rootWikiFolder }
	},
}

local windows = {
	fs = {
		home = os.getenv("UserProfile"),
		projects = (os.getenv("UserProfile") or "") .. "/Projects",
	},
	cmd = {
		open_finder = "start ..",
		file_exists = "test -f %s ; expr 1 - $? ", -- { %1 = file to search }
		vimwiki_search = "find %1 -maxdepth %2 %3 -type d -name %4 -print | sed s#%1##", -- { %1 = projectsFolder, %2 = maxDepth, %3 = ignoreFolders, %4 = rootWikiFolder }
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

