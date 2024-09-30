return {
  "theHamsta/nvim-dap-virtual-text",
  config = function()
    require("nvim-dap-virtual-text").setup {
      highlight_changed_variables = true,
      highlight_new_as_changed = true,
      only_first_definition = false,
      -- all_references = true,
      -- virt_text_win_col = 80,
    }
  end,
}
