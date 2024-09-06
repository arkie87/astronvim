return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		local keymap = vim.keymap

		keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add current buffer to Harpoon list" })

		keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "View Harpoon List" })

		keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "View First Harpoon Buffer" })

		keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "View Second Harpoon Buffer" })

		keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "View Third Harpoon Buffer" })

		keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "View Fourth Harpoon Buffer" })

		keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "View Fifth Harpoon Buffer" })

		keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, { desc = "View Sixth Harpoon Buffer" })

		keymap.set("n", "<leader>A", function()
			harpoon:list():remove()
		end, { desc = "Remove current buffer from Harpoon list" })
	end,
}
