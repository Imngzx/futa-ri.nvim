local M = {}

function M.setup(opts)
  opts = opts or {}
  require('futari.pairs').setup(opts.pairs)
  require('futari.surround').setup(opts.surround)
  require('futari.tabout').setup(opts.tabout)
end

return M
