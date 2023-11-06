local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "awk",
    "bash",
    "make",
    "cmake",
    "dockerfile",
    "dot",
    "git_config",
    "git_rebase",
    "gitignore",
    "json",
    "latex",
    "kconfig",
    "mermaid",
    "nix",
    "python",
    "rst",
    "rust",
    "sql",
    "terraform",
    "toml",
    "vim",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- mine
    "terraform-ls",
    "json-lsp",
    "yaml-language-server",
    "rnix-lsp",
    "marksman",
    "dockerfile-language-server",
    "pyright",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
