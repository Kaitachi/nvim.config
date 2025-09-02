local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- MARK: Snacks Picker Integration
local normalize_list = function(t)
	local normalized = {}
	for _, v in pairs(t) do
		if v ~= nil then
			table.insert(normalized, v)
		end
	end
	return normalized
end

local harpoon_picker_finder = function()
	local paths = {}
	local list = normalize_list(harpoon:list().items)
	for _, item in ipairs(list) do
		table.insert(paths, { text = item.value, file = item.value })
	end
	return paths
end

local harpoon_remove_item = function(picker, item)
	local to_remove = item or picker:selected()
	harpoon:list():remove({ value = to_remove.text })
	harpoon:list().items = normalize_list(harpoon:list().items)
	picker:find({ refresh = true })
end


--#region KEYMAPS
vim.keymap.set("n", "<C-e>", function()
	Snacks.picker({
		finder = harpoon_picker_finder,
		win = {
			input = {
				keys = { ["dd"] = { "harpoon_delete", mode = { "n", "x" } } },
			},
			list = {
				keys = { ["dd"] = { "harpoon_delete", mode = { "n", "x" } } },
			},
		},
		actions = {
			harpoon_delete = harpoon_remove_item,
		},
	})
end, { desc = "[Harpoon] Open Harpoon window" })

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "[Harpoon] Go to first file" })
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "[Harpoon] Go to second file" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "[Harpoon] Go to third file" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "[Harpoon] Go to fourth file" })

vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end, { desc = "[Harpoon] Go to next file" })
vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end, { desc = "[Harpoon] Go to previous file" })

vim.keymap.set("n", "<C-s>", function() harpoon:list():add() end, { desc = "[Harpoon] Add file to list" })
vim.keymap.set("n", "<C-g>", function() harpoon:list():select(vim.v.count1) end,
	{ desc = "[Harpoon] Go to {count} file" })
--#endregion
