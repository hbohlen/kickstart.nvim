vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true -- Only if you have one installed

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs/indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 600 -- More forgiving leader-key window
vim.opt.splitright = true
vim.opt.splitbelow = true

-- File handling
vim.opt.undofile = true
vim.opt.swapfile = false
