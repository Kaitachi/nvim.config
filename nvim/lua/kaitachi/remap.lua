-- HINT: Show current mappings with :nmap :vmap :imap
local qf = require("kaitachi.qflist")

-- vim.g.mapleader = " "

-- Let's make things foolproof...
vim.keymap.set("n", "Q", "<nop>", { desc = "[Vim] Disable ex mode" })
vim.keymap.set("n", "¥", "<leader>", { desc = "[Keyboard] Convenience leader shortcut for Japanese keyboard" })
vim.keymap.set({ "n", "i", "v" }, "<PageUp>", "<nop>", { desc = "[Vim] Disable <PageUp>" })
vim.keymap.set({ "n", "i", "v" }, "<PageDown>", "<nop>", { desc = "[Vim] Disable <PageDown>" })

-- Show explorer
vim.keymap.set("n", "<leader>+", vim.cmd.Ex, { desc = "[Vim] Show File Explorer" })

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "[Vim] Move down and center window" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "[Vim] Move up and center window" })
vim.keymap.set("n", "n", "nzzzv", { desc = "[Vim] Move to next match and center window" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "[Vim] Move to previous match and center window" })

-- Greatest remap ever (paste from clipboard)
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[Vim] Paste from clipboard" })

-- Next greatest remap ever (copy selection to clipboard) : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Format] Copy text selection to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Format] Copy current line to clipboard" })

-- Merge current and next line
vim.keymap.set("v", "<C-bslash><C-j>", "mzJ`z", { desc = "[Vim] Merge current and next line" })

-- Move text while in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "[Vim] Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "[Vim] Move lines up" })

-- Delete word (same shortcut as OS)
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "[Vim] Delete word" })
vim.keymap.set("i", "<C-h>", "<C-w>", { desc = "[Vim] Delete word" })

-- Easy yank/paste
vim.keymap.set("n", "P", [["0p]], { desc = "[Vim] Paste without replacing register" })

-- Update file executable flag
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "[Vim] Make current file executable" })

-- Buffer management
vim.keymap.set("n", "<leader>-", vim.cmd.bd, { desc = "[Vim] Close current buffer" })
vim.keymap.set("n", "<leader>[", vim.cmd.bp, { desc = "[Vim] Move to previous buffer" })
vim.keymap.set("n", "<leader>]", vim.cmd.bn, { desc = "[Vim] Move to next buffer" })
vim.keymap.set("n", "<BS>", "<C-o>", { desc = "[Vim] Move to previous location" })

-- Quickfix management
vim.keymap.set("n", "<C-up>", vim.cmd.cprevious, { desc = "[qf] Move to previous qflist item" })
vim.keymap.set("n", "<C-down>", vim.cmd.cnext, { desc = "[qf] Move to next qflist item" })
vim.keymap.set("n", "<F6>", function() qf.toggle_qf "q" end, { desc = "[qf] Toggle qflist" })
vim.keymap.set("n", "<F18>", function() qf.toggle_qf "l" end, { desc = "[qf] Toggle loclist" })

-- Go to Packer file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/kaitachi/packer.lua<CR>",
	{ desc = "[Packer] Go to Packer file" })

-- Remove some default keymaps
vim.keymap.del("n", "gO")
vim.keymap.del("n", "gcc")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("x", "gra")
