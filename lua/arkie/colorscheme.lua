--Colors
local GREY = "#CCCCCC"
local YELLOW = "#FFFF00"
local ORANGE = "#F67126"
local BLUE = "#2ACCF5"
local GREEN = "#A6E22E"
local RED = "#FF0000"
local PURPLE = "#FFCCFF"
local BLACK = "#000000"

local cmd = vim.cmd

local highlight = function(group, command) cmd("hi! " .. group .. " " .. command) end

--GUI
highlight("MatchParen", "guifg=" .. RED .. " gui=underline")
highlight("CursorLineNr", "guifg=" .. YELLOW)
highlight("LineNr", "guifg=" .. GREY)

--Punctuations
highlight("Operator", "guifg=" .. ORANGE) --operators e.g. +=-
highlight("@punctuation.bracket", "guifg=" .. ORANGE) --e.g. [{()}]
highlight("@punctuation.delimiter", "guifg=" .. ORANGE) --e.g. :,.

--Comments
highlight("Comment", "guifg=" .. ORANGE)

--Variables
highlight("Identifier", "guifg=" .. GREY) --variables
highlight("@property", "guifg=" .. GREY) --properties

--Built-Ins
local LITERAL = " guifg=#FFFF00"
highlight("@type.builtin", LITERAL .. " gui=bold,italic")
highlight("@function.builtin", LITERAL)
highlight("@constructor", LITERAL)
highlight("@attribute", LITERAL) --decorator

--Literals
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

--Diagnostics
highlight("DiagnosticVirtualTextError", "guifg=" .. RED .. " guibg=" .. BLACK)
highlight("DiagnosticVirtualTextWarn", "guifg=" .. ORANGE .. " guibg=" .. BLACK)
highlight("DiagnosticVirtualTextInfo", "guifg=" .. BLUE .. " guibg=" .. BLACK)
highlight("DiagnosticVirtualTextHint", "guifg=" .. GREEN .. " guibg=" .. BLACK)