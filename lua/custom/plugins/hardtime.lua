return {
	'm4xshen/hardtime.nvim',
	dependencies = { 'MunifTanjim/nui.nvim' },
	event = 'VeryLazy',
	opts = {
		max_count = 3,     -- Allow 3 hjkl presses before blocking
		disable_mouse = false, -- Keep mouse initially
		restricted_keys = {
			['h'] = { 'n', 'x' },
			['j'] = { 'n', 'x' },
			['k'] = { 'n', 'x' },
			['l'] = { 'n', 'x' },
			['-'] = { 'n', 'x' },
			['+'] = { 'n', 'x' },
		},
		disabled_keys = {
			['<Up>'] = {}, -- Disable arrow keys completely
			['<Down>'] = {},
			['<Left>'] = {},
			['<Right>'] = {},
		},
		disabled_filetypes = { 'qf', 'netrw', 'lazy', 'mason', 'TelescopePrompt' },

		-- Custom hints for bad habits
		hints = {
			['d[tTfF].i'] = {
				message = function(keys)
					return 'Use c' .. keys:sub(2, 3) .. ' instead of ' .. keys
				end,
				length = 4,
			},
		},
	},
	config = function(_, opts)
		require('hardtime').setup(opts)

		-- See your worst habits
		vim.keymap.set('n', '<leader>hr', '<cmd>Hardtime report<CR>', { desc = '[H]ardtime [R]eport' })

		-- Toggle hardtime
		vim.keymap.set('n', '<leader>ht', '<cmd>Hardtime toggle<CR>', { desc = '[H]ardtime [T]oggle' })
	end,
}
