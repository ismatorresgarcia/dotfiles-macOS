-- LSP
-- managing & installing lsp servers, linters & formatters
return {
  "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  ft = { "lua", "c", "cpp", "f90", "py", "js", "ts", "html" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- install or upgrade all of mason tools.
  },
  config = function()
    local mason = require("mason") -- import mason plugin safely
    local mason_lspconfig = require("mason-lspconfig") -- import mason-lspconfig plugin safely
    local mason_tool_installer = require("mason-tool-installer") -- import mason-tool-installer plugin safely
    mason.setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "clangd",
        "fortls",
        "pyright",
        --"lua_ls",   -- there's something wrong with this server
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same option as ensure_installed
    })
    mason_tool_installer.setup({
      -- list of formatters and linters for the mason tool to install
      ensure_installed = {
        "stylua", -- lua formatter
        "clang-format", -- C/C++ formatter
        "fprettify", -- modern fortran formatter
        "isort", -- python formatter
        "black", -- python formatter
        --"yapf", -- python formatter
        "pylint", -- python linter
      },
    })
  end,
}
