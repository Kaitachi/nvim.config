-- HINT: Show current mappings with :nmap :vmap :imap

-- vim.g.mapleader = " "

-- Let's make things foolproof...
vim.keymap.set("n", "Q", "<nop>")

-- Show explorer
vim.keymap.set("n", "<leader>P", vim.cmd.Ex)

-- Navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Merge current and next line
vim.keymap.set("n", "J", "mzJ`z")

-- Move text while in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Easy find/replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Update file executable flag
vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Tab management
--vim.keymap.set("n", "<leader>a", vim.cmd.tabnew)
--vim.keymap.set("n", "<leader>x", vim.cmd.tabclose)
--vim.keymap.set("n", "<leader>h", vim.cmd.tabprevious)
--vim.keymap.set("n", "<leader>l", vim.cmd.tabnext)
--vim.keymap.set("n", "<leader>t", "<cmd>exe 'tabn '.v:count1<CR>") -- use [count]\t to switch to corresponding tab

-- Buffer management
vim.keymap.set("n", "<leader>b", "<cmd>exe 'b '.v:count<CR>") -- use [count]\b to switch to corresponding buffer
vim.keymap.set("n", "<leader>=", vim.cmd.Ex)
vim.keymap.set("n", "<leader>-", vim.cmd.bd)
vim.keymap.set("n", "<leader>h", vim.cmd.bp)
vim.keymap.set("n", "<leader>l", vim.cmd.bn)

-- Go to Packer file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/kaitachi/packer.lua<CR>");

