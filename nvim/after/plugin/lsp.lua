local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  -- See :help lsp-zero-keybindings
  local opts = {buffer = bufnr, remap = false}

  -- Diagnostic keymaps
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

lsp.setup_servers({'gopls', 'tsserver', 'svelte'})

-- Custom coloring for virtual text
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { ctermbg = "DarkRed", ctermfg = "White", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { ctermbg = "DarkYellow", ctermfg = "White", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { ctermbg = "DarkBlue", ctermfg = "White", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { ctermbg = "DarkGrey", ctermfg = "White", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { ctermbg = "DarkGreen", ctermfg = "White", italic = true })

