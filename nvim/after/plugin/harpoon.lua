local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-t>", function() vim.cmd [[ lua require("harpoon.ui").toggle_quick_menu() ]] end, { desc = "Add file to Harpoon list" })
vim.keymap.set("n", "<C-s>", function() harpoon:list():add() end, { desc = "Add file to Harpoon list" })
vim.keymap.set("n", "<C-g>", function() harpoon:list():select(vim.v.count1) end, { desc = "Go to selected Harpoon file" })
vim.keymap.set("n", "<C-e>", function() vim.cmd [[ Telescope harpoon marks ]] end,
	{ desc = "Open harpoon window" })

function Remove(item)
  item = item or harpoon:list().config.create_list_item(harpoon:list().config)
  print("Hello")
  local Extensions = require("harpoon.extensions")
  local Logger = require("harpoon.logger")

  local items = harpoon:list().items
  if item ~= nil then
    for i = 1, harpoon:list()._length do
      local v = items[i]
      print(vim.inspect(v))
      if harpoon:list().config.equals(v, item) then
        -- this clears list somehow
        -- items[i] = nil
        table.remove(items, i)
        harpoon:list()._length = harpoon:list()._length - 1

        Logger:log("HarpoonList:remove", { item = item, index = i })

        Extensions.extensions:emit(
          Extensions.event_names.REMOVE,
          { list = harpoon:list(), item = item, idx = i }
        )
        break
      end
    end
  end
end

-- Telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_buffer_number, map)
		  map(
			"i",
			"<C-x>", -- your mapping here
			function()
			  local state = require("telescope.actions.state")
			  local selected_entry = state.get_selected_entry()
			  local current_picker = state.get_current_picker(prompt_buffer_number)

			  harpoon:list():remove(selected_entry.index)
			  current_picker:refresh(make_finder())
			end
		  )

		  return true
		end
  }):find()
end

-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
-- 	{ desc = "Open harpoon window" })


