return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      path = 3,
      icons_enabled = true,
      theme = 'horizon',
      component_separators = '|',
      section_separators = '',
    },
  },
  config = function()
    local custom = require 'lualine.themes.horizon'

    custom.normal.c.bg = '#191919'

    require('lualine').setup {
      options = { theme = custom },
    }
  end
}
