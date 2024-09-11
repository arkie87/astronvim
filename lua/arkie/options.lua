--Shortcut
local opt = vim.opt

--cmdheight
-- opt.cmdheight = 1

--Scrolloff set
opt.scrolloff = 10

--StatusColumn Width
SINGLENUMBERWIDTH = 4
DUALNUMBERWIDTH = 7
opt.numberwidth = DUALNUMBERWIDTH

--Highlight matching parentheses
vim.cmd "hi MatchParen guifg=red gui=underline"
