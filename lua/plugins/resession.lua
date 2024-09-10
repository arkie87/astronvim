return {
  "stevearc/resession.nvim",
  lazy = true,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local resession = require "resession"
        maps.n["<Leader>s"] = { desc = "Sessions" }
        maps.n["<Leader>s."] = { function() resession.load "Last Session" end, desc = "Load last session" }
        maps.n["<Leader>ss"] = { function() resession.save() end, desc = "Save this session" }
        maps.n["<Leader>sS"] = {
          function()
            print "detach"
            resession.detach()
            resession.save()
          end,
          desc = "Saveas this session",
        }
        maps.n["<Leader>sd"] = { function() require("resession").delete() end, desc = "Delete a session" }
        maps.n["<Leader>sl"] = { function() require("resession").load() end, desc = "Load a session" }
        opts.autocmds.resession_auto_save = {
          {
            event = "VimLeavePre",
            desc = "Save session on close",
            callback = function()
              local buf_utils = require "astrocore.buffer"
              local autosave = buf_utils.sessions.autosave
              if autosave and buf_utils.is_valid_session() then
                local save = require("resession").save
                if autosave.last then save("Last Session", { notify = false }) end
                if autosave.cwd then save(vim.fn.getcwd(), { dir = "dirsession", notify = false }) end
              end
            end,
          },
        }
      end,
    },
  },
  opts = {
    buf_filter = function(bufnr) return require("astrocore.buffer").is_restorable(bufnr) end,
    tab_buf_filter = function(tabpage, bufnr) return vim.tbl_contains(vim.t[tabpage].bufs, bufnr) end,
    extensions = { astrocore = { enable_in_tab = true } },
  },
}
