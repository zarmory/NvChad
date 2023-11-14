---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-t>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvim-tree" },
    ["<A-f>"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvim-tree" },
    ["<F5>"] = { "<cmd> Telescope undo<CR>", "Show undo history" },
    ["<Y>"] = { "y$", "Yank from the cursor to the end of line" },
    ["<A-p>"] = { '"zp', "Paste from the register z" },
    ["<A-d>"] = { '"zd$', "Delete the line from cursor to the register z" },
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<A-y>"] = { '"zy', "Yank into the register z"},
    ["<A-d>"] = { '"zd', "Delete into the register z"},
  },
  i = {
    ["<F5>"] = { "<cmd> Telescope undo<CR>", "Show undo history" },
  },
}

-- more keybinds!

return M
