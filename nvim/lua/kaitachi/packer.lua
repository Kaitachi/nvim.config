-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use({ 'wbthomason/packer.nvim' })

	-- Color Schemes / UI
	use({ 'nvim-lualine/lualine.nvim' })
	use({ 'nordtheme/vim' })
	use({ 'folke/todo-comments.nvim' })

	-- Treesitter (code structure parsing)
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({ 'nvim-treesitter/nvim-treesitter-context' })
	use({ 'nvim-treesitter/playground' })

	-- Harpoon (quick-access files)
	use({
		'theprimeagen/harpoon',
		branch = 'harpoon2',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})

	-- Vim Git (Git for Vim)
	use({ 'lewis6991/gitsigns.nvim' })
	use({ 'linrongbin16/gitlinker.nvim' })

	-- Vim enhancements
	use({ 'mbbill/undotree' })   -- Git for undo/redo commands
	use({ 'folke/flash.nvim' })  -- Better searching
	use({ 'folke/snacks.nvim' }) -- Swiss army knife
	use({ 'folke/which-key.nvim' }) -- Display keyboard shortcuts as you go
	use({ 'folke/edgy.nvim' })   -- Fancy layout manager

	-- Language Server Protocol
	-- LSP Support
	use({ 'neovim/nvim-lspconfig' })
	use({
		'mason-org/mason.nvim',
		requires = 'mason-org/mason-lspconfig.nvim'
	})
	use({ 'onsails/lspkind.nvim' }) -- LSP symbol font

	-- Debugger
	use({
		'mfussenegger/nvim-dap',
		requires = {
			{ 'rcarriga/nvim-dap-ui' },
			{ 'nvim-neotest/nvim-nio' },

			-- Pre-configured Debuggers
			{ 'leoluz/nvim-dap-go' },
		}
	})

	-- SQL Queries
	use({
		'tpope/vim-dadbod',
		requires = {
			{ 'kristijanhusak/vim-dadbod-completion' },
			{ 'kristijanhusak/vim-dadbod-ui' },
		}
	})

	-- Golang Support
	use({ 'ray-x/go.nvim' })

	-- Vim motions practice
	use({ 'theprimeagen/vim-be-good' })
end)
