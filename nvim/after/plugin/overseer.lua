local overseer = require("overseer")

overseer.setup()

vim.keymap.set('n', '<F6>', overseer.toggle, { desc = "Toggle Overseer"})
vim.keymap.set('n', '<F18>', overseer.run_template, { desc = "Run Overseer template" })
