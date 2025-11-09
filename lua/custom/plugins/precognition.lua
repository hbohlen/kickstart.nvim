return {
	'tris203/precognition.nvim',
	event = 'VeryLazy',
	opts = {
		startVisible = true, -- Always show hints initially
		showBlankVirtLine = true,
		highlightColor = { link = 'Comment' },

		-- Customize which hints to show (set prio = 0 to hide)
		hints = {
			Caret = { text = '^', prio = 2 },
			Dollar = { text = '$', prio = 1 },
			MatchingPair = { text = '%', prio = 5 },
			Zero = { text = '0', prio = 1 },
			w = { text = 'w', prio = 10 },
			b = { text = 'b', prio = 9 },
			e = { text = 'e', prio = 8 },
		},

		gutterHints = {
			G = { text = 'G', prio = 10 },
			gg = { text = 'gg', prio = 9 },
			PrevParagraph = { text = '{', prio = 8 },
			NextParagraph = { text = '}', prio = 8 },
		},

		disabled_fts = { 'startify', 'TelescopePrompt', 'mason' },
	},
	config = function(_, opts)
		require('precognition').setup(opts)

		-- Toggle with <leader>tp
		vim.keymap.set('n', '<leader>tp', function()
			require('precognition').toggle()
		end, { desc = '[T]oggle [P]recognition hints' })
	end,
}
