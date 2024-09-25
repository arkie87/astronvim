-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  opts = function(_, opts)
    local patch = function(orig)
      local colors = orig()
      local get_hl = require("astroui").get_hlgroup

      colors.buffer_fg = get_hl("TabLine").fg
      colors.buffer_bg = get_hl("TabLine").bg
      colors.buffer_active_fg = get_hl("TabLineSel").fg
      colors.buffer_active_bg = get_hl("TabLineSel").bg
      return colors
    end

    opts.status.setup_colors = require("astrocore").patch_func(opts.status.setup_colors, patch)
  end,
}
