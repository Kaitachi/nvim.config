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

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

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

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader>a", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>tabn 1<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>tabn 2<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>tabn 3<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>tabn 4<CR>")
vim.keymap.set("n", "<leader>5", "<cmd>tabn 5<CR>")
vim.keymap.set("n", "<leader>6", "<cmd>tabn 6<CR>")
vim.keymap.set("n", "<leader>7", "<cmd>tabn 7<CR>")
vim.keymap.set("n", "<leader>8", "<cmd>tabn 8<CR>")
vim.keymap.set("n", "<leader>9", "<cmd>tabn 9<CR>")

