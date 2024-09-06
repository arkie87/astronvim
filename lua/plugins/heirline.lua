return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statuscolumn = {
      init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      status.component.foldcolumn(),
      status.component.numbercolumn { numbercolumn = { culright = false } },
      status.component.signcolumn(),
    }
  end,
}
