local keymap = vim.keymap

-- GENERAL --

-- Remove Arrow Keys
keymap.set({ "i", "n" }, "<left>", "<Nop>", { desc = "Disable left arrow" })
keymap.set({ "i", "n" }, "<right>", "<Nop>", { desc = "Disable right arrow" })
keymap.set({ "i", "n" }, "<up>", "<Nop>", { desc = "Disable up arrow" })
keymap.set({ "i", "n" }, "<down>", "<Nop>", { desc = "Disable down arrow" })

-- Change redo to U
keymap.set("n", "U", "<C-r>", { noremap = true, desc = "Redo" })

--Search results in center of screen
keymap.set("n", "n", "nzz", { noremap = true })
keymap.set("n", "N", "Nzz", { noremap = true })

--Scrolling keep screen centered
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

--Inserting blank lines with enter
keymap.set("n", "<enter>", "o<esc>")
keymap.set("n", "<leader><enter>", "O<esc>", { noremap = true })

--Exiting terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

--Shortcut to repeat macro
keymap.set("n", "Q", "@q")

--Keep cursor in place when applying J
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

--Move block of text up/down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })

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
keymap.set("n", "<leader>`", "<cmd>w<CR><cmd>!python3 %<CR>", { desc = "Run current file" })

--Appends
keymap.set("n", "<Leader><leader>", "", { desc = "►Edit Macros" })
keymap.set("n", "<leader><leader>,", "A,<esc>J", { desc = "Append comma and join" })
keymap.set("n", "<leader><leader>;", "A;<esc>J", { desc = "Append semicolon and join" })
keymap.set("n", "<leader><leader>'", "I'<esc>A',<esc>j", { desc = "Surround single quote and join" })
keymap.set("n", '<leader><leader>"', 'I"<esc>A",<esc>j', { desc = "Surround double quote and join" })
