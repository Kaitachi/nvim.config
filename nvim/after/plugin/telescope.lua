local builtin = require('telescope.builtin')

-- Telescope Search
vim.keymap.set('n', '<leader><leader>', builtin.builtin, {})
vim.keymap.set('n', '<leader>P', builtin.planets, {})

-- Vim Search
vim.keymap.set('n', '<leader>H', builtin.help_tags, {})
vim.keymap.set('n', '<leader>K', builtin.keymaps, {})
vim.keymap.set('n', '<leader>C', builtin.commands, {})
vim.keymap.set('n', '<leader>B', builtin.buffers, {})
vim.keymap.set('n', '<leader>R', builtin.registers, {})

-- File Search
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})

-- Buffer Search
vim.keymap.set('n', '<leader>M', builtin.marks, {})

-- LSP
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gI', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>S', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>W', builtin.lsp_dynamic_workspace_symbols, {})

