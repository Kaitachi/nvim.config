-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use({ 'wbthomason/packer.nvim' })

	-- File Searching
	use({ 'ggandor/leap.nvim' })
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})

	-- Color Schemes / UI
	use({ 'itchyny/lightline.vim' })
	use({ 'sainnhe/edge' })
	use({ 'folke/todo-comments.nvim' })

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

	-- Vim enhancements
	use({ 'mbbill/undotree' })       -- Git for undo/redo commands
	use({ 'terrortylor/nvim-comment' }) -- Comment/uncomment code
	use({ 'stevearc/overseer.nvim' }) -- Terminal within nvim

	-- Language Server Protocol
	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig',              tag = 'v1.8.0',  pin = true },
			{ 'mason-org/mason.nvim',               tag = 'v1.11.0', pin = true },
			{ 'mason-org/mason-lspconfig.nvim',     tag = 'v1.32.0', pin = true },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },           -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },       -- Required
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Optional
			{ 'hrsh7th/cmp-buffer' },         -- Optional
			{ 'hrsh7th/cmp-path' },           -- Optional
			{ 'saadparwaiz1/cmp_luasnip' },   -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },       -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	})

	-- dap - Debugger
	use({
		'mfussenegger/nvim-dap',
		requires = {
			{ 'rcarriga/nvim-dap-ui' },
			{ 'nvim-neotest/nvim-nio' },

			-- Pre-configured Debuggers
			{ 'leoluz/nvim-dap-go' },
		}
	})

	-- dadbod - SQL Queries
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
