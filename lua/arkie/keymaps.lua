local keymap = vim.keymap

-- GENERAL --

-- Remove Arrow Keys
keymap.set({ "i", "n" }, "<left>", "<Nop>", { desc = "Disable left arrow" })
keymap.set({ "i", "n" }, "<right>", "<Nop>", { desc = "Disable right arrow" })
keymap.set({ "i", "n" }, "<up>", "<Nop>", { desc = "Disable up arrow" })
keymap.set({ "i", "n" }, "<down>", "<Nop>", { desc = "Disable down arrow" })

--Shift-Tab
keymap.set("i", "<S-Tab>", "<Esc><<_i")

-- Change redo to U
keymap.set("n", "U", "<C-r>", { noremap = true, desc = "Redo" })

--Search results in center of screen
keymap.set("n", "n", "nzz", { noremap = true })
keymap.set("n", "N", "Nzz", { noremap = true })

--Scrolling keep screen centered
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

--Inserting blank lines with <C-O> and <A-O>
keymap.set("n", "<C-o>", "o<esc>", { noremap = true })
keymap.set("n", "<A-o>", "O<esc>", { noremap = true })

--Exiting terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

--Shortcut to repeat macro
keymap.set("n", "Q", "@q")

--Keep cursor in place when applying J
keymap.set("n", "J", "mzJ`z", { noremap = true })

--Move block of text up/down
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })

--Hold selection while indenting
keymap.set("v", "<", "<gv", { noremap = true })
keymap.set("v", ">", ">gv", { noremap = true })

--Highlight all
keymap.set({ "n", "v", "i" }, "<C-a>", "<esc>ggVG", { desc = "Select all" })

--Save
keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save" })

--Next/Prev
keymap.set("n", "[(", "?(<CR>", { desc = "Previous (" })
keymap.set("n", "[[", "?[<CR>", { desc = "Previous [" })
keymap.set("n", "[{", "?{<CR>", { desc = "Previous {" })
keymap.set("n", "[)", "?)<CR>", { desc = "Previous )" })
keymap.set("n", "[]", "?]<CR>", { desc = "Previous ]" })
keymap.set("n", "[}", "?}<CR>", { desc = "Previous }" })

keymap.set("n", "](", "/(<CR>", { desc = "Next (" })
keymap.set("n", "][", "/[<CR>", { desc = "Next [" })
keymap.set("n", "]{", "/{<CR>", { desc = "Next {" })
keymap.set("n", "])", "/)<CR>", { desc = "Next )" })
keymap.set("n", "]]", "/]<CR>", { desc = "Next ]" })
keymap.set("n", "]}", "/}<CR>", { desc = "Next }" })

--
-- LEADER COMMANDS --
--

--Toggle relative numbers
vim.keymap.set("n", "<leader>un", function()
  rnu = vim.opt.relativenumber:get()
  vim.opt.relativenumber = not rnu
  if rnu then
    vim.opt.numberwidth = SINGLENUMBERWIDTH
  else
    vim.opt.numberwidth = DUALNUMBERWIDTH
  end
end, { desc = "Toggle relative numbers" })

-- Increment/Decrement
keymap.set("n", "<leader>=", "<C-a>", { noremap = true, desc = "Increment" })
keymap.set("n", "<leader>-", "<C-x>", { noremap = true, desc = "Decrement" })
keymap.set("v", "<leader>=", "g<C-a>", { noremap = true, desc = "Increment" })
keymap.set("v", "<leader>-", "g<C-x>", { noremap = true, desc = "Decrement" })

--Actions
-- keymap.set("n", "<leader>`", "<cmd>w<CR><cmd>!python3 ~/.config/nvim/run.py %<CR>", { desc = "Run current file" })
keymap.set({ "n", "i", "v", "t", "x" }, "<F12>", "<cmd>ToggleTerm direction=float<CR>")
keymap.set({ "n", "i", "v", "t", "x" }, "<F24>", "<cmd>ToggleTerm direction=horizontal<CR>")
keymap.set({ "n", "i", "v", "t", "x" }, "<F36>", "<cmd>ToggleTerm direction=vertical<CR>")

--Inspect
keymap.set({ "n", "v" }, "<leader>I", "<cmd>Inspect<CR>")

--Appends
keymap.set("n", "<Leader><leader>", "", { desc = "►Edit Macros" })
keymap.set("n", "<leader><leader>,", "A,<esc>J", { desc = "Append comma and join" })
keymap.set("n", "<leader><leader>;", "A;<esc>J", { desc = "Append semicolon and join" })
keymap.set("n", "<leader><leader>'", "I'<esc>A',<esc>j", { desc = "Surround single quote and join" })
keymap.set("n", '<leader><leader>"', 'I"<esc>A",<esc>j', { desc = "Surround double quote and join" })

--Debugger
local dap = require "dap"
local dapui = require "dapui"
local widgets = require "dap.ui.widgets"

keymap.set("n", "<F2>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
keymap.set("n", "<F14>", dap.set_breakpoint, { desc = "Set Breakpoint" })
keymap.set("n", "<F26>", dap.clear_breakpoints, { desc = "Clear Breakpoints" })

keymap.set("n", "<F5>", dap.continue, { desc = "Debug Continue" })
keymap.set("n", "<F17>", dap.restart, { desc = "Debug Restart" })
keymap.set("n", "<F29>", dap.terminate, { desc = "Debug Terminate" })
keymap.set("n", "<F53>", dap.run_to_cursor, { desc = "Run to Cursor" })

keymap.set("n", "<F6>", dap.step_over, { desc = "Step Over" })
keymap.set("n", "<F18>", dap.step_into, { desc = "Step Into" })
keymap.set("n", "<F30>", dap.step_out, { desc = "Step Out" })

keymap.set("n", "<F1>", widgets.hover, { desc = "Hover" })
keymap.set("n", "<F13>", dap.repl.toggle, { desc = "Toggle REPL" })
keymap.set("v", "<F1>", dapui.eval, { desc = "Evaluate selection" })

DIRECTION = "float"

local display_direction = function()
  print("ToggleTerm Set to " .. DIRECTION)
  vim.cmd("ToggleTerm direction=" .. DIRECTION)
  vim.cmd("ToggleTerm direction=" .. DIRECTION)
end

keymap.set("n", "<leader>tf", function()
  DIRECTION = "float"
  display_direction()
end, { desc = "Set Default Terminal to Float" })

keymap.set("n", "<leader>tv", function()
  DIRECTION = "vertical"
  display_direction()
end, { desc = "Set Default Terminal to Vertical" })

keymap.set("n", "<leader>th", function()
  DIRECTION = "horizontal"
  display_direction()
end, { desc = "Set Default Terminal to Horizontal" })

keymap.set("n", "<leader>tt", function()
  DIRECTION = "tab"
  display_direction()
end, { desc = "Set Default Terminal to Tab" })

keymap.set(
  "n",
  "<leader>`",
  '<cmd>w<CR><cmd>TermExec cmd=reset<CR><cmd>TermExec cmd="python3 ~/.config/nvim/run.py %"<CR>',
  { desc = "Run current file" }
)
