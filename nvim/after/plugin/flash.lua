local flash = require("flash")

vim.keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "[Flash] Search" })
vim.keymap.set({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "[Flash] Treesitter Search" })
