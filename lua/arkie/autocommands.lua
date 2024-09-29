--Highlighted Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "HighlightedYank", timeout = 200 } end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function() print "focus gain" end,
-- })
--
-- vim.api.nvim_create_autocmd("BufLeave", {
--   pattern = "*",
--   callback = function() print "focus lost" end,
-- })
