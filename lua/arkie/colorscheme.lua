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

local NONE = { "guifg=", GREY }
local COMMENT = { "guifg=", YELLOW }
local KEYWORD = { " guifg=", BLUE }
local BUILTIN = { "guifg=", ORANGE }

local LITERAL = { "guifg=", PURPLE }
local VARIABLE = { "guifg=", ORANGE }

local FUNCTION = { "guifg=", GREEN }
local PUNCTUATION = { "guifg=", YELLOW }

local highlight = function(group, commands)
  local str = group
  for _, v in ipairs(commands) do
    str = str .. " " .. v
  end
  vim.cmd("hi! " .. str)
end

--GUI
highlight("MatchParen", { "guifg=", BLUE, "gui=underline" })
highlight("CursorLine", { "guibg=", DARKGREY })
highlight("CursorLineNr", { "guifg=", YELLOW })
highlight("LineNr", { "guifg=", GREY })
highlight("WinSeparator", { "guifg=", GREY })
highlight("ColorColumn", { "guibg=", "none" })
highlight("Visual", { "guibg=", DARKGREY })
highlight("HighlightedYank", { "guifg=", BLACK, "guibg=", YELLOW })
highlight("IlluminatedWordRead", { "guifg=", BLACK, "guibg=", YELLOW, "gui=underline" })
highlight("IlluminatedWordWrite", { "guifg=", BLACK, "guibg=", ORANGE, "gui=underline" })

--Punctuations
highlight("Operator", PUNCTUATION) --operators e.g. +=-
highlight("@punctuation.bracket", PUNCTUATION) --e.g. [{()}]
highlight("@punctuation.delimiter", PUNCTUATION) --e.g. :,.
highlight("@punctuation.special", PUNCTUATION) --e.g. f-string {}
highlight("@constructor.lua", PUNCTUATION) --e.g. {} in lua
highlight("@attribute", PUNCTUATION) --decorator

--Comments
highlight("Comment", COMMENT)

--None
highlight("Identifier", NONE) --variables

--Variables
highlight("@property", VARIABLE) --properties
highlight("@variable.parameter", VARIABLE) --args, kwargs

--Built-Ins
highlight("@type.builtin", BUILTIN)
highlight("@function.builtin", BUILTIN)

--Literals
highlight("Constant", LITERAL)
highlight("Character", LITERAL)
highlight("String", LITERAL)
highlight("Number", LITERAL)
highlight("Float", LITERAL)
highlight("Boolean", LITERAL)

--Keywords
highlight("Keyword", KEYWORD)
highlight("@keyword.function", KEYWORD)
highlight("Include", KEYWORD) --Import
highlight("Typedef", KEYWORD) --Class
highlight("Conditional", KEYWORD) --If
highlight("Define", KEYWORD) --Define
highlight("Repeat", KEYWORD) --For/while
highlight("@variable.builtin", KEYWORD) --Self

--Functions
highlight("Type", FUNCTION)
highlight("Function", FUNCTION)
highlight("@constructor", FUNCTION)

--Diagnostics
highlight("DiagnosticVirtualTextError", { "guifg=", RED, "guibg=", BLACK })
highlight("DiagnosticVirtualTextWarn", { "guifg=", ORANGE, "guibg=", BLACK })
highlight("DiagnosticVirtualTextInfo", { "guifg=", BLUE, "guibg=", BLACK })
highlight("DiagnosticVirtualTextHint", { "guifg=", GREEN, "guibg=", BLACK })
