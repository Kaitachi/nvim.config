local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<C-s>", function() harpoon:list():add() end, { desc = "Add file to Harpoon list" })
vim.keymap.set("n", "<C-g>", function() harpoon:list():select(vim.v.count1) end, { desc = "Go to selected Harpoon file" })
vim.keymap.set("n", "<C-e>", function() vim.cmd [[ Telescope harpoon marks ]] end,
	{ desc = "Open harpoon window" })

