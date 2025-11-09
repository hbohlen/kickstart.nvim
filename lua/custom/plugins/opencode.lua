return {
  'NickvanDyke/opencode.nvim',
  cmd = { 'Opencode' },
  keys = {
    { '<leader>oc', '<cmd>Opencode<cr>', desc = '[O]pen[C]ode' },
  },
  config = function()
    require('opencode').setup({
      -- Your opencode configuration here
    })
  end,
}