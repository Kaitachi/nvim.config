local comments = require("todo-comments")

comments.setup({
	keywords = {
		MARK = { icon = "󱋜", color = "error", signs = true },
	},
})

-- So, apparently macOS does not support the color nomenclature used by todo-comments... =(
if vim.loop.os_uname().sysname == "Darwin" then
	vim.cmd('hi TodoSignTODO ctermfg=202')
	vim.cmd('hi TodoFgTODO ctermfg=202') -- orange
	vim.cmd('hi TodoBgTODO ctermbg=202 ctermfg=15 cterm=bold') -- white on orange

	vim.cmd('hi TodoSignFIX ctermfg=9')
	vim.cmd('hi TodoFgFIX ctermfg=9') -- red
	vim.cmd('hi TodoBgFIX ctermbg=9 ctermfg=15 cterm=bold') -- white on red

	vim.cmd('hi TodoSignHACK ctermfg=111')
	vim.cmd('hi TodoFgHACK ctermfg=111') -- blue
	vim.cmd('hi TodoBgHACK ctermbg=111 ctermfg=15 cterm=bold') -- white on blue

	vim.cmd('hi TodoSignNOTE ctermfg=10')
	vim.cmd('hi TodoFgNOTE ctermfg=10') -- green
	vim.cmd('hi TodoBgNOTE ctermbg=10 ctermfg=15 cterm=bold') -- white on green

	vim.cmd('hi TodoSignWARN ctermfg=11')
	vim.cmd('hi TodoFgWARN ctermfg=11') -- yellow
	vim.cmd('hi TodoBgWARN ctermbg=11 ctermfg=15 cterm=bold') -- white on yellow

	vim.cmd('hi TodoSignMARK ctermfg=14')
	vim.cmd('hi TodoFgMARK ctermfg=14') -- cyan
	vim.cmd('hi TodoBgMARK ctermbg=14 ctermfg=15 cterm=bold') -- white on cyan

	vim.cmd('hi TodoSignTEST ctermfg=239')
	vim.cmd('hi TodoFgTEST ctermfg=239') -- gray
	vim.cmd('hi TodoBgTEST ctermbg=239 ctermfg=15 cterm=bold') -- white on gray

	vim.cmd('hi TodoSignPERF ctermfg=53')
	vim.cmd('hi TodoFgPERF ctermfg=53') -- purple
	vim.cmd('hi TodoBgPERF ctermbg=53 ctermfg=15 cterm=bold') -- white on purple
end

