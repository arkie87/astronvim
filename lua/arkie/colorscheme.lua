--Colors
local GREY = "#CCCCCC"
local DARKGREY = "#444444"
local YELLOW = "#cccc00"
local ORANGE = "#F67126"
local BLUE = "#2ACCF5"
local DARKBLUE = "#10003a"
local GREEN = "#A6E22E"
local RED = "#FF0000"
local PURPLE = "#ccaaFF"
local BLACK = "#000000"
local LIGHTBLACK = "#222222"

local NONE = { "guifg=", GREY }
local COMMENT = { "guifg=", PURPLE, "gui=None" }
local KEYWORD = { " guifg=", BLUE, "gui=None" }
local BUILTIN = { "guifg=", ORANGE }

local LITERAL = { "guifg=", YELLOW }
local VARIABLE = { "guifg=", BLUE }

local FUNCTION = { "guifg=", GREEN }
local PUNCTUATION = { "guifg=", ORANGE }

local highlight = function(group, commands)
  local str = group
  for _, v in ipairs(commands) do
    str = str .. " " .. v
  end
  vim.cmd("hi! " .. str)
end

--GUI
highlight("Normal", { "guifg=", GREY, "guibg=", DARKBLUE })
highlight("NormalNC", { "guifg=", GREY, "guibg=", DARKBLUE })
highlight("NormalFloat", { "guifg=", GREY, "guibg=", LIGHTBLACK })
highlight("NeoTreeNormal", { "guifg=", GREY, "guibg=", DARKBLUE })
highlight("NeoTreeNormalNC", { "guifg=", GREY, "guibg=", DARKBLUE })
highlight("TabLine", { "guifg=", DARKGREY, "guibg=", BLACK })
highlight("TabLineSel", { "guifg=", GREY, "guibg=", DARKBLUE })
highlight("MatchParen", { "guifg=", BLUE, "gui=underline" })
highlight("CursorLine", { "guibg=", DARKGREY })
highlight("CursorLineNr", { "guifg=", YELLOW })
highlight("LineNr", { "guifg=", GREY })
highlight("WinSeparator", { "guifg=", BLUE })
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

--Comments
highlight("Comment", COMMENT)

--None
highlight("Identifier", NONE) --variables

--Variables
highlight("@variable.builtin", LITERAL) --Self
highlight("@property", VARIABLE) --properties
highlight("@variable.parameter", VARIABLE) --args, kwargs
highlight("@attribute", VARIABLE) --decorator

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
highlight("@string.escape", FUNCTION)

--Keywords
highlight("Keyword", KEYWORD)
highlight("@keyword.function", KEYWORD)
highlight("Include", KEYWORD) --Import
highlight("Typedef", KEYWORD) --Class
highlight("Conditional", KEYWORD) --If
highlight("Define", KEYWORD) --Define
highlight("Repeat", KEYWORD) --For/while
highlight("Exception", KEYWORD) --Try/Except

--Functions
highlight("Type", FUNCTION)
highlight("Function", FUNCTION)
highlight("@constructor", FUNCTION)

--Diagnostics
highlight("DiagnosticVirtualTextError", { "guifg=", RED, "guibg=", BLACK })
highlight("DiagnosticVirtualTextWarn", { "guifg=", ORANGE, "guibg=", BLACK })
highlight("DiagnosticVirtualTextInfo", { "guifg=", BLUE, "guibg=", BLACK })
highlight("DiagnosticVirtualTextHint", { "guifg=", GREEN, "guibg=", BLACK })

highlight("DiagnosticUnnecessary", { "guifg=", BLACK, "guibg=", GREEN, "gui=underline" })
highlight("DiagnosticUnderlineInfo", { "guifg=", BLACK, "guibg=", BLUE, "gui=underline" })
highlight("DiagnosticUnderlineWarn", { "guifg=", BLACK, "guibg=", ORANGE, "gui=underline" })
highlight("DiagnosticUnderlineError", { "guifg=", BLACK, "guibg=", RED, "gui=underline" })

--Debug Virtual Text
highlight("NvimDapVirtualText", { "guifg=", PURPLE, "guibg=", BLACK })
highlight("NvimDapVirtualTextChanged", { "guifg=", PURPLE, "guibg=", BLACK, "gui=underline" })
