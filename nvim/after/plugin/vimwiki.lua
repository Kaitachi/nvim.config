local projects = nil

if (os.getenv("HOME") ~= nil) then
	projects = os.getenv("HOME") .. '/Developer'
elseif (os.getenv("UserProfile") ~= nil) then
	projects = os.getenv("UserProfile") .. '/Projects'
else
	projects = 'TEST'
end

-- print('home is ' .. os.getenv("HOME"))
-- print('projects is ' .. projects)

-- Kudos to Mirko Vukušić from dev.to for the snippet below!
-- https://dev.to/psiho/vimwiki-how-to-automate-wikis-per-project-folder-neovim-3k72

-- configuration
local config = {
	projectsFolder = projects,
	maxDepth = 5,
	ignoreFolders = { 'node_modules', '.git' },
	rootWikiFolder = '_ Wiki',
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
	local command = 'find ' .. config.projectsFolder .. ' -maxdepth ' .. config.maxDepth

	if #config.ignoreFolders > 0 then command = command .. " \\(" end

	for _, f in ipairs(config.ignoreFolders) do
		command = command .. " -path '*/"..f.."/*' -prune"
		if next(config.ignoreFolders,_) == nil then
			command = command .. " \\) -o"
		else
			command = command .. " -o"
		end
	end

	command = command .. ' -type d -name ' .. config.rootWikiFolder
	command = command .. ' -print | '
	command = command .. ' sed s#' .. config.projectsFolder .. '##'
	local list = vim.api.nvim_call_function('systemlist', {command})
	return list
end

updateVimwikiList(searchForWikis())
