-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use({ 'wbthomason/packer.nvim' })

	-- Color Schemes / UI
	use({ 'itchyny/lightline.vim' })
	use({ 'nordtheme/vim' })
	use({ 'sainnhe/edge' })
	use({ 'folke/todo-comments.nvim' })

	-- Searching Superpowers
	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{ 'nvim-telescope/telescope-frecency.nvim' },
			{ 'nvim-lua/plenary.nvim' }
		}
	})

	-- Treesitter (code structure parsing)
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({ 'nvim-treesitter/playground' })
	use({ 'nvim-treesitter/nvim-treesitter-context' })

	-- Harpoon (quick-access files)
	use({
		'theprimeagen/harpoon',
		branch = 'harpoon2',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})

	-- Vim Git (Git for Vim)
	use({ 'tpope/vim-fugitive' })
	use({ 'lewis6991/gitsigns.nvim' })
	use({ 'linrongbin16/gitlinker.nvim' })

	-- Vim enhancements
	use({ 'folke/flash.nvim' })    -- Better searching
	use({ 'folke/which-key.nvim' }) -- Display keyboard shortcuts as you go
	use({ 'mbbill/undotree' })     -- Git for undo/redo commands
	use({ 'stevearc/overseer.nvim' }) -- Terminal within neovim

	-- Language Server Protocol
	-- LSP Support
	use({ 'neovim/nvim-lspconfig' })
	use({
		'mason-org/mason.nvim',
		requires = 'mason-org/mason-lspconfig.nvim'
	})
	use({ 'onsails/lspkind.nvim' })

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
