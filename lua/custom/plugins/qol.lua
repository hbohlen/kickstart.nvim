return {
	-- tmux navigation (if you install tmux)
	{ 'christoomey/vim-tmux-navigator',              lazy = false },

	-- Auto-detect indent
	{ 'tpope/vim-sleuth',                            event = 'BufReadPost' },

	-- Comments
	{ 'numToStr/Comment.nvim',                       event = 'VeryLazy',               config = true },
	{ 'JoosepAlviste/nvim-ts-context-commentstring', opts = { enable_autocmd = false } },

	-- Surround
	{ 'kylechui/nvim-surround',                      event = 'VeryLazy',               config = true },

	-- Indent guides
	{ 'lukas-reineke/indent-blankline.nvim',         main = 'ibl',                     event = 'BufReadPost', opts = {} },
}
