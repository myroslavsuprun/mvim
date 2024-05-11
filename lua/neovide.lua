if vim.g.neovide == true then
  vim.o.guifont = 'Fira Code:h12'
  vim.api.nvim_set_keymap('n', '<F11>', ':let g:neovide_fullscreen = !g:neovide_fullscreen<CR>', {})
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_cursor_vfx_mode = 'railgun'
  vim.g.neovide_cursor_trail_size = 0.8
end
