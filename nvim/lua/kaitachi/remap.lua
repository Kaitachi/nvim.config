-- HINT: Show current mappings with :nmap :vmap :imap

-- vim.g.mapleader = " "

-- Let's make things foolproof...
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<PageUp>", "<nop>")
vim.keymap.set("n", "<PageDown>", "<nop>")
vim.keymap.set("n", "¥", "<leader>")

vim.keymap.set("i", "<PageUp>", "<nop>")
vim.keymap.set("i", "<PageDown>", "<nop>")

vim.keymap.set("v", "<PageUp>", "<nop>")
vim.keymap.set("v", "<PageDown>", "<nop>")

-- Show explorer
vim.keymap.set("n", "<leader>+", vim.cmd.Ex)

-- Navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever (copy to clipboard)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Next greatest remap ever (copy selection to clipboard) : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Merge current and next line
vim.keymap.set("v", "<C-bslash><C-j>", "mzJ`z")

-- Move text while in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Easy find/replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Easy yank/paste
vim.keymap.set("n", "P", [["0p]])

-- Update file executable flag
vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Buffer management
vim.keymap.set("n", "<leader>-", vim.cmd.bd)
vim.keymap.set("n", "<leader>[", vim.cmd.bp)
vim.keymap.set("n", "<leader>]", vim.cmd.bn)
vim.keymap.set("n", "<BS>", "<C-o>")

-- Split management
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- Go to Packer file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/kaitachi/packer.lua<CR>")

