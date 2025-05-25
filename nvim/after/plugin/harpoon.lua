local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "[Harpoon] Go to first file" })
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "[Harpoon] Go to second file" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "[Harpoon] Go to third file" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "[Harpoon] Go to fourth file" })

-- FIX: BROKEN COMMANDS! Find out how to fix these...
vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end, { desc = "[Harpoon] Go to next file" })
vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end, { desc = "[Harpoon] Go to previous file" })

vim.keymap.set("n", "<C-s>", function() harpoon:list():add() end, { desc = "[Harpoon] Add file to list" })
vim.keymap.set("n", "<C-g>", function() harpoon:list():select(vim.v.count1) end,
	{ desc = "[Harpoon] Go to {count} file" })

-- Telescope Integration
local function harpoon_get_paths(files)
	-- NOTE: This function REMOVES entries completely!
	-- Default behavior consists of setting the element nil, but that leaves
	-- an empty space in our list (which feels odd to me).
	-- See the following for more details:
	-- https://github.com/ThePrimeagen/harpoon/pull/628
	local paths = {}
	for _, item in ipairs(files.items) do
		table.insert(paths, item.value)
	end
	return paths
end

local function harpoon_make_finder(paths)
	return require("telescope.finders").new_table({
		results = paths,
	})
end

local conf = require("telescope.config").values
function toggle_telescope(harpoon_files)
	local file_paths = harpoon_get_paths(harpoon_files)

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon Marks",
		finder = harpoon_make_finder(file_paths),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_buffer_number, map)
			map("i", "<C-x>", function()
				local state = require("telescope.actions.state")
				local selected_entry = state.get_selected_entry()
				local current_picker = state.get_current_picker(prompt_buffer_number)

				-- harpoon:list():remove_at(selected_entry.index)
				table.remove(harpoon:list().items, selected_entry.index)
				current_picker:refresh(harpoon_make_finder(harpoon_get_paths(harpoon:list())))
			end
			)

			return true
		end
	}):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
	{ desc = "[Harpoon] Open Harpoon window" })
