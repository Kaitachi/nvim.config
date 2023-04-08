-- Show current mappings with :nmap :vmap :imap

-- vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move text while in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- Merge current and next line
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Keep cursor centred when scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Keep cursor centred when scrolling
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/kaitachi/packer.lua<CR>");

-- Tab management
vim.keymap.set("n", "<leader>a", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>exe 'tabn '.v:count1<CR>") -- use [count]\t to switch to corresponding tab

