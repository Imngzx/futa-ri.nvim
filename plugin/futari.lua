-- futari.nvim - Zero-dep auto-pairs + surround + tabout
-- Loads on InsertEnter automatically

if vim.g.loaded_futari then return end
vim.g.loaded_futari = true

vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    require('futari').setup()
  end,
})