require('custom.options')
require('custom.keymaps')

-- Ensure lazy.nvim is installed and on the runtime path
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Lazy will automatically load plugins/ files
require('lazy').setup('custom.plugins', {
	change_detection = { notify = false },
})

-- Set colorscheme after plugins load
vim.cmd.colorscheme 'tokyonight-night'
