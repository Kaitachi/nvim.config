local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>R', builtin.registers, {})
vim.keymap.set('n', '<leader>K', builtin.keymaps, {})
vim.keymap.set('n', '<leader>B', builtin.buffers, {})

