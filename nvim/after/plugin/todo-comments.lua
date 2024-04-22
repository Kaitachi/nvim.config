local comments = require("todo-comments")

comments.setup({
	keywords = {
		MARK = { icon = "󱋜", color = "error", signs = true },
	},
})

-- So, apparently macOS does not support the color nomenclature used by todo-comments... =(
if not vim.o.termguicolors then
	-- Red
	vim.cmd('hi TodoSignFIX ctermfg=DarkRed')
	vim.cmd('hi TodoFgFIX ctermfg=DarkRed')
	vim.cmd('hi TodoBgFIX ctermbg=DarkRed ctermfg=White cterm=bold')

	-- Orange
	vim.cmd('hi TodoSignTODO ctermfg=202')
	vim.cmd('hi TodoFgTODO ctermfg=202')
	vim.cmd('hi TodoBgTODO ctermbg=202 ctermfg=White cterm=bold')

	-- Yellow
	vim.cmd('hi TodoSignWARN ctermfg=DarkYellow')
	vim.cmd('hi TodoFgWARN ctermfg=DarkYellow')
	vim.cmd('hi TodoBgWARN ctermbg=DarkYellow ctermfg=233 cterm=bold')

	-- Green
	vim.cmd('hi TodoSignNOTE ctermfg=DarkGreen')
	vim.cmd('hi TodoFgNOTE ctermfg=DarkGreen')
	vim.cmd('hi TodoBgNOTE ctermbg=DarkGreen ctermfg=White cterm=bold')

	-- Cyan
	vim.cmd('hi TodoSignMARK ctermfg=Cyan')
	vim.cmd('hi TodoFgMARK ctermfg=Cyan')
	vim.cmd('hi TodoBgMARK ctermbg=Cyan ctermfg=White cterm=bold')

	-- Blue
	vim.cmd('hi TodoSignHACK ctermfg=DarkBlue')
	vim.cmd('hi TodoFgHACK ctermfg=DarkBlue')
	vim.cmd('hi TodoBgHACK ctermbg=DarkBlue ctermfg=White cterm=bold')

	-- Violet
	vim.cmd('hi TodoSignPERF ctermfg=53')
	vim.cmd('hi TodoFgPERF ctermfg=53')
	vim.cmd('hi TodoBgPERF ctermbg=53 ctermfg=White cterm=bold')

	-- Brown
	vim.cmd('hi TodoSignTEST ctermfg=Brown')
	vim.cmd('hi TodoFgTEST ctermfg=Brown')
	vim.cmd('hi TodoBgTEST ctermbg=Brown ctermfg=White cterm=bold')
end

