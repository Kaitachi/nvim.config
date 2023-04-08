local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader><leader>a", mark.add_file)
vim.keymap.set("n", "<leader><leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader><leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader><leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader><leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader><leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader><leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader><leader>7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader><leader>8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader><leader>9", function() ui.nav_file(9) end)

