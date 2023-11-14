---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark", -- chocolate is also very good but a bit too plate
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  changed_themes = {
     onedark = {
       -- copied from onedark theme
       base_30 = {
         darker_black = "#222222",
         black = "#262626",  -- our konsole bg
         one_bg2 = "#393635",
         statusline_bg = "#2c2c2c", -- z
       },
       base_16 = {
         base00 = "#262626",  -- our konsole bg
         base02 = "#2f2f2f",
       },
       polish_hl = {
          -- too much red by default
          ["@field"] = { fg = "#a7aebb" },
          ["@parameter"] = { fg = "#98b7c3" },
       },
     },
     -- chocolate = {
     --   -- copied from onedark theme
     --   base_30 = {
     --     darker_black = "#222222",
     --     black = "#262626",  -- our konsole bg
     --     one_bg2 = "#393635",
     --     statusline_bg = "#2c2c2c", -- z
     --   },
     --   base_16 = {
     --     base00 = "#262626",  -- our konsole bg
     --     base02 = "#2f2f2f",
     --   },
     -- },
  },

  statusline = {
    theme = "vscode_colored",
    overriden_modules = function(modules)
      modules[9] = (function()
        return "%#StText#%p%% Ln %l, Col %c "
      end)()
      -- drop the curly brackets
      modules[11] = (function()
        local function stbufnr()
          return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
        end
        local ft = vim.bo[stbufnr()].ft
        return ft == "" and "%#St_ft# plain text  " or "%#St_ft#" .. ft .. " "
      end)()

      -- Don't show file encoding. You can always see it with `set fileencoding'.
      table.remove(modules, 10)
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
