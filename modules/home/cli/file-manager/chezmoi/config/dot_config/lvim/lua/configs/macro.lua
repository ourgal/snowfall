local M = {}

M.config = function()
  vim.fn.setreg("n", '"z4yy3j"zpkA,j^j$brriqj$be2k^') -- new
  vim.fn.setreg("r", "4yy3jpkA,j^2j$be2k^") -- repeat
  vim.fn.setreg("i", "3yy2jpkA,j^j$3bek^") -- image
  vim.fn.setreg("d", "^yejrre^")
end

return M
