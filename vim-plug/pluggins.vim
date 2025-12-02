call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'preservim/nerdtree'
	Plug 'liuchengxu/vim-which-key'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'neovim/nvim-lspconfig'
	Plug 'ray-x/go.nvim'
	Plug 'ray-x/guihua.lua'
	Plug 'ray-x/navigator.lua'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'        " Completion engine
	Plug 'hrsh7th/cmp-nvim-lsp'    " LSP source for nvim-cmp
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
    Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
    Plug 'romgrk/barbar.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
