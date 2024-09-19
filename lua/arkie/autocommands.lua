--Highlighted Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "HighlightedYank", timeout = 200 } end,
})
print "farts"
