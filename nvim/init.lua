vim.cmd("source ~/.config/nvim/vim/lightline_custom.vim")
require("kaitachi")

_G.dd = function(...)
	Snacks.debug.inspect(...)
end
_G.bt = function()
	Snacks.debug.backtrace()
end
vim.print = _G.dd
