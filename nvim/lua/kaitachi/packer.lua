-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	-- File Searching
	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- Color Schemes
	use({'vim-airline/vim-airline'})
	use({'vim-airline/vim-airline-themes'})
	use({'jaredgorski/SpaceCamp'})

	-- Treesitter (code structure parsing)
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')

	use('terrortylor/nvim-comment')

	-- Harpoon (quick-access files)
	use('theprimeagen/harpoon')

	-- Undo Tree (git for undo/redo commands)
	use('mbbill/undotree')

	-- Vim Git (Git for Vim)
	use('tpope/vim-fugitive')
	use('airblade/vim-gitgutter')

	-- Language Server Protocol
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

	-- Vimwiki
	use({'vimwiki/vimwiki'})
end)
