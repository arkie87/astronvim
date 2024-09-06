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

--Inserting blank lines with enter
keymap.set("n", "<enter>", "o<esc>")
keymap.set("n", "<C-enter>", "O<esc>", { noremap = true })

--Exiting terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

--Shortcut to repeat macro
keymap.set("n", "Q", "@q")

-- LEADER COMMANDS --

-- Increment/Decrement
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement" })
keymap.set("v", "<leader>=", "g<C-a>", { desc = "Increment" })
keymap.set("v", "<leader>-", "g<C-x>", { desc = "Decrement" })

--Highlight all
keymap.set("n", "<leader>v", "ggVG", { desc = "Select all" })

--Actions
keymap.set("n", "<leader>`", "<cmd>w<CR><cmd>!python3 %<CR>", { desc = "Run current file" })

--Appends
keymap.set("n", "<leader>,", "A,<esc>J", { desc = "Append comma and join" })
keymap.set("n", "<leader>;", "A;<esc>J", { desc = "Append semicolon and join" })
keymap.set("n", "<leader>'", "I'<esc>A',<esc>j", { desc = "Surround single quote and join" })
keymap.set("n", '<leader>"', 'I"<esc>A",<esc>j', { desc = "Surround double quote and join" })

keymap.set("n", "<leader>(", "I(<esc>A)<esc>j", { desc = "Surround in parantheses" })
keymap.set("n", "<leader>[", "I[<esc>A]<esc>j", { desc = "Surround in brackets" })
keymap.set("n", "<leader>{", "I{<esc>A}<esc>j", { desc = "Surround in braces" })
