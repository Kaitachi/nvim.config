local overseer = require("overseer")

overseer.setup()

vim.keymap.set('n', '<F9>', overseer.toggle, { desc = "[Terminal] Toggle Overseer" })
vim.keymap.set('n', '<F11>', overseer.run_template, { desc = "[Terminal] Run Overseer Template" })
