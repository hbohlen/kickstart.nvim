return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      config = function()
        require('telescope').load_extension('frecency')
      end,
    },
  },
  cmd = 'Telescope',  -- Lazy load on command
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = '[F]ind [F]iles' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = '[F]ind by [G]rep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = '[F]ind [B]uffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = '[F]ind [H]elp' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = '[F]ind [R]ecent files' },
    { '<leader>fR', '<cmd>Telescope frecency workspace=CWD<cr>', desc = '[F]ind [R]ecent (smart)' },
    { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = '[F]ind current [W]ord' },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        -- Performance: limit results for large projects
        file_ignore_patterns = { 'node_modules', '.git/', '__pycache__' },
        
        -- UI improvements
        path_display = { 'truncate' },
        layout_config = {
          horizontal = { preview_width = 0.55 },
        },
        
        -- Better sorting
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
      },
      pickers = {
        find_files = {
          hidden = true,  -- Show hidden files
          find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
        },
      },
    })
    
    -- Load fzf extension for faster sorting
    pcall(require('telescope').load_extension, 'fzf')
  end,
}