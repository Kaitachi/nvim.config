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

-- Set lightline current file path (relative to nvim's cwd)
vim.api.nvim_exec([[
function! LightlineCurrentRelativePath()
	return expand('%:.')
endfunction
]], false)

-- Set lightline Diagnostic warning count
vim.api.nvim_exec([[
function! LightlineDiagnosticWarns()
	if !empty(v:lua.vim.diagnostic.count()[1])
		return v:lua.vim.diagnostic.count()[1]
	endif

	return ""
endfunction
]], false)

-- Set lightline Diagnostic error count
vim.api.nvim_exec([[
function! LightlineDiagnosticErrors()
	if !empty(v:lua.vim.diagnostic.count()[0])
		return v:lua.vim.diagnostic.count()[0]
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
			{ 'readonly', 'relpath', 'modified' }
		},
		right = {
			{ 'lineinfo' },
			{ 'percent', 'diagnosticwarns', 'diagnosticerrs' },
			{ 'fileformat', 'fileencoding', 'filetype' }
		}
	},
	component_function = {
		gitbranch = 'LightlineGitCurrentBranch',
		relpath = 'LightlineCurrentRelativePath'
	},
	component_expand = {
		gitdetachedhead = 'LightlineGitDetachedHead',
		diagnosticwarns = 'LightlineDiagnosticWarns',
		diagnosticerrs = 'LightlineDiagnosticErrors',
	},
	component_type = {
		gitdetachedhead = 'error',
		diagnosticwarns = 'warning',
		diagnosticerrs = 'error'
	},
}
