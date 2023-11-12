return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'tokyonight',
      component_separators = '|',
      section_separators = '',
      fmt = string.lower,
    },
    sections = {
      lualine_a = { {
        'mode',
        fmt = function(str)
          return str:sub(1, 1)
        end,
      } },
      lualine_x = { 'filetype' },
    },
  },
}
