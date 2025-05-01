local overseer = require("overseer")

overseer.setup()

vim.keymap.set('n', '<F9>', overseer.toggle, { desc = "Toggle Overseer"})
vim.keymap.set('n', '<F11>', overseer.run_template, { desc = "[macOS] Run Overseer template" })
vim.keymap.set('n', '<F21>', overseer.run_template, { desc = "[Linux] Run Overseer template" })
