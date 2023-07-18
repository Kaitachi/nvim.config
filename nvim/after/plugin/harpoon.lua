local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-m>", mark.add_file)
vim.keymap.set("n", "<C-g>", function() ui.nav_file(vim.v.count1) end)

