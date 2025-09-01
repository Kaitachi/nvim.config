local toggleterm = require("toggleterm")

toggleterm.setup({})

vim.keymap.set('n', '<F11>', function() vim.cmd("TermSelect") end, { desc = "[ToggleTerm] Select Terminal" })
