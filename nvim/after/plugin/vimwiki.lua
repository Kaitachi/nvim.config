local cmd = require("kaitachi.command")

-- Kudos to Mirko Vukušić from dev.to for the snippet below!
-- https://dev.to/psiho/vimwiki-how-to-automate-wikis-per-project-folder-neovim-3k72
-- Slightly adapted for compatibility

-- configuration
local config = {
	projectsFolder = cmd.fs.projects,
	maxDepth = 5,
	ignoreFolders = { 'node_modules', '.git' },
	rootWikiFolder = '_\\ Wiki',
	wikiConfig = { syntax = 'markdown', ext = '.md' }
}

-- store original vimwiki_list config, we will need it later
-- !!!make sure vimwiki plugin is loaded before running this!!!
if vim.g.vimwiki_list == nil then
	--error('VimWiki not loaded yet! make sure VimWiki is initialized before my-projects-wiki')
	_G.vimwiki_list_orig = {}
else
	_G.vimwiki_list_orig = vim.fn.copy(vim.g.vimwiki_list) or {}
end

-- function to update g:vimwiki_list config item from list of subfolder names (append project wikis)
--   this way, orginal <Leader>ws will get new project wikis in the list and also keep ones from config
local function updateVimwikiList(folders)
	local new_list = vim.fn.copy(vimwiki_list_orig)

	for _, f in ipairs(folders) do
		local item = {
			path = config.projectsFolder..f,
			syntax = config.wikiConfig.syntax,
			ext = config.wikiConfig.ext
		}
		table.insert(new_list, item)
	end

	vim.g.vimwiki_list = new_list
	vim.api.nvim_call_function('vimwiki#vars#init',{})
end

-- function to search project folders for root wiki folders (returns system list)
local function searchForWikis()
	local exclusions = ""

	if #config.ignoreFolders > 0 then exclusions = "\\(" end

	for _, f in ipairs(config.ignoreFolders) do
		exclusions = exclusions .. " -path '*/"..f.."/*' -prune"
		if next(config.ignoreFolders,_) == nil then
			exclusions = exclusions .. " \\) -o"
		else
			exclusions = exclusions .. " -o"
		end
	end

	local command = string.gsub(cmd.cmd.vimwiki_search, "%%%d+",
							{
								["%1"] = config.projectsFolder,
								["%2"] = config.maxDepth,
								["%3"] = exclusions,
								["%4"] = config.rootWikiFolder
							})

	return vim.api.nvim_call_function('systemlist', {command})
end

updateVimwikiList(searchForWikis())

