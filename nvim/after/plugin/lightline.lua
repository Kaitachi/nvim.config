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
		gitbranch = 'FugitiveHead'
	},
	component_expand = {
		gitdetachedhead = 'LightlineGitDetachedHead'
	},
	component_type = {
		gitdetachedhead = 'error'
	},
}
