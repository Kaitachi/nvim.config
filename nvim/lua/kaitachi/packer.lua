-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use({'wbthomason/packer.nvim'})

	-- File Searching
	use({'ggandor/leap.nvim'})
	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- Color Schemes / UI
	use({'itchyny/lightline.vim'})
	use({'sainnhe/edge'})

	-- Treesitter (code structure parsing)
	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({'nvim-treesitter/playground'})
	use({'nvim-treesitter/nvim-treesitter-context'})

	-- Code utilities
	use({'terrortylor/nvim-comment'})

	-- Harpoon (quick-access files)
	use({'theprimeagen/harpoon', branch = 'harpoon2',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- Undo Tree (git for undo/redo commands)
	use({'mbbill/undotree'})

	-- Vim Git (Git for Vim)
	use({'tpope/vim-fugitive'})
	use({'lewis6991/gitsigns.nvim'})

	-- Good ol' bookmarks
	use({'MattesGroeger/vim-bookmarks'})

	-- Highlight todo, notes, etc
	use({'folke/todo-comments.nvim'})

	-- Language Server Protocol
	use({
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
			{'hrsh7th/cmp-nvim-lsp-signature-help'},     -- Optional
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	})

	-- dap - Debugger
	use({
		'mfussenegger/nvim-dap',
		requires = {
			{'rcarriga/nvim-dap-ui'},
			{'nvim-neotest/nvim-nio'},

			-- Preconfigured Debuggers
			{'leoluz/nvim-dap-go'},
		}
	})

	-- dadbod - SQL Queries
	use({
		'tpope/vim-dadbod',
		requires = {
			{'kristijanhusak/vim-dadbod-completion'},
			{'kristijanhusak/vim-dadbod-ui'},
		}
	})

	-- Golang Support
	use({'ray-x/go.nvim'})

	-- Vim motions practive
	use({'theprimeagen/vim-be-good'})
end)
