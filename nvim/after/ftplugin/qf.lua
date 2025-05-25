local qf = require("kaitachi.qflist")

vim.keymap.set("n", "dd", qf.delete, { buffer = true, desc = "[qf] Delete entry" })
vim.keymap.set("v", "d", qf.delete, { buffer = true, desc = "[qf] Delete entries" })
