--Colors
local GREY = "#CCCCCC"
local DARKGREY = "#555555"
local YELLOW = "#FFFF00"
local ORANGE = "#F67126"
local BLUE = "#2ACCF5"
local GREEN = "#A6E22E"
local RED = "#FF0000"
local PURPLE = "#ccaaFF"
local BLACK = "#000000"

local highlight = function(group, command) vim.cmd("hi! " .. group .. " " .. command) end

--GUI
highlight("MatchParen", "guifg=none gui=underline")
highlight("CursorLine", "guibg=" .. DARKGREY)
highlight("CursorLineNr", "guifg=" .. YELLOW)
highlight("LineNr", "guifg=" .. GREY)
highlight("WinSeparator", "guifg=" .. GREY)
highlight("ColorColumn", "guibg=" .. DARKGREY)

--Punctuations
highlight("Operator", "guifg=" .. PURPLE) --operators e.g. +=-
highlight("@punctuation.bracket", "guifg=" .. PURPLE) --e.g. [{()}]
highlight("@punctuation.delimiter", "guifg=" .. PURPLE) --e.g. :,.

--Comments
highlight("Comment", "guifg=" .. ORANGE)

--Variables
highlight("Identifier", "guifg=" .. GREY) --variables
highlight("@property", "guifg=" .. GREY) --properties

--Built-Ins
local BUILTIN = "guifg=" .. ORANGE
highlight("@type.builtin", BUILTIN .. " gui=bold,italic")
highlight("@function.builtin", BUILTIN)
highlight("@attribute", BUILTIN) --decorator

--Literals
local LITERAL = "guifg=" .. YELLOW
highlight("Constant", LITERAL)
highlight("Character", LITERAL)
highlight("String", LITERAL)
highlight("Number", LITERAL)
highlight("Float", LITERAL)
highlight("Boolean", LITERAL)

--Keywords
local KEYWORD = " guifg=" .. BLUE .. " cterm=bold,italic"
highlight("Keyword", KEYWORD)
highlight("@keyword.function", KEYWORD)
highlight("Include", KEYWORD) --Import
highlight("Typedef", KEYWORD) --Class
highlight("@variable.builtin", KEYWORD) --Self
highlight("@variable.parameter", KEYWORD) --args, kwargs
highlight("Conditional", KEYWORD)
highlight("Define", KEYWORD)

--Functions
local FUNCTION = " guifg=" .. GREEN .. " gui=bold"
highlight("Type", FUNCTION)
highlight("Function", FUNCTION)
highlight("@constructor", FUNCTION)

--Diagnostics
highlight("DiagnosticVirtualTextError", "guifg=" .. RED .. " guibg=" .. BLACK)
highlight("DiagnosticVirtualTextWarn", "guifg=" .. ORANGE .. " guibg=" .. BLACK)
highlight("DiagnosticVirtualTextInfo", "guifg=" .. BLUE .. " guibg=" .. BLACK)
highlight("DiagnosticVirtualTextHint", "guifg=" .. GREEN .. " guibg=" .. BLACK)
