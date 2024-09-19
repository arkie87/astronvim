--Shortcut
local opt = vim.opt

--Tabs
TABWidth = 2
opt.tabstop = TABWidth
opt.shiftwidth = TABWidth
opt.softtabstop = TABWidth
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

--Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

--Appearance
opt.cursorline = true
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.cmdheight = 1
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.completeopt = "menuone"

--Behaivor
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.modifiable = true
opt.encoding = "utf-8"

--StatusColumn Width
SINGLENUMBERWIDTH = 4
DUALNUMBERWIDTH = 7
opt.numberwidth = DUALNUMBERWIDTH

--Illumination
vim.g.Illuminate_delay = 0
