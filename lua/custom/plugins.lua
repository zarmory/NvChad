local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  --[[
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim"
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            use_delta = true,
            diff_context_lines = 10,
          },
        },
      })
    end,
  },
  ]]

  -- This needs further understanding / refactoring
  -- See https://github.com/debugloop/telescope-undo.nvim/issues/38#issuecomment-1801229149
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          { "nvim-lua/plenary.nvim" },
        },
      },
    },
    keys = {
      { "<F5>", "<cmd>Telescope undo<cr>", desc = "undo history", },
    },
    opts = {
      extensions = {
        undo = {
          side_by_side = true,
          use_delta = true,
        },
      },
    },
    config = function(_, opts)
      -- Disabled as per https://github.com/debugloop/telescope-undo.nvim/issues/38#issuecomment-1807988016
      -- These are defaults anyway
      -- opts.defaults.mappings = {
      --   i = {
      --     ['<c-y>'] = require('telescope-undo.actions').yank_deletions,
      --     ['<c-r>'] = require('telescope-undo.actions').restore,
      --   },
      -- }
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
