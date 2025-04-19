local overseer = require("overseer")

overseer.setup()

vim.keymap.set('n', ';', overseer.toggle, {})
vim.keymap.set('n', '<leader>;', overseer.run_template, {})
