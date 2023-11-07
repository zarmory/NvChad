---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-t>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvim-tree" },
    ["<A-f>"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvim-tree" },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
