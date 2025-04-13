-- Set lightline detached head message
vim.api.nvim_exec([[
function! LightlineGitDetachedHead()
	if exists("*FugitiveHead")
		if empty(FugitiveGitDir())
			return ""
		elseif !empty(FugitiveHead())
			return ""
		else
			return "HEAD detached at " . FugitiveHead(7)
	endif

	return "Git not found =("
endfunction
]], false)

-- Set lightline current branch name (remove parent folders from branch name)
vim.api.nvim_exec([[
function! LightlineGitCurrentBranch()
	if exists("*FugitiveHead")
		if empty(FugitiveHead())
			return ""
		elseif match(FugitiveHead(), "/") < 0
			return FugitiveHead()
		else
			return "…" . matchstr(FugitiveHead(), '/[^/]*$')
	endif

	return ""
endfunction
]], false)

-- FIXME: Currently not using this object!!!
return {
	colorscheme = 'custom',
	active = {
		left = {
			{ 'mode', 'paste' },
			{ 'gitdetachedhead', 'gitbranch' },
			{ 'readonly', 'relativepath', 'modified' }
		},
	},
	component_function = {
		gitbranch = 'LightlineGitCurrentBranch'
	},
	component_expand = {
		gitdetachedhead = 'LightlineGitDetachedHead'
	},
	component_type = {
		gitdetachedhead = 'error'
	},
}
