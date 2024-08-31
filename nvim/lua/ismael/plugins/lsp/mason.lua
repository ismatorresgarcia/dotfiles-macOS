-- LSP
-- managing & installing lsp servers, linters & formatters
return {
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	ft = { "c", "cpp", "f90", "py", "html", "js", "ts", "lua" },
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
				-- "html",
				-- "emmet_ls",
        "clangd",
        "fortls",
				"pyright",
				-- "texlab",
				-- "tsserver",
				-- "lua_ls",   -- there's something wrong with this server
				-- "cssls",
				-- "tailwindcss",
				-- "svelte"
				-- "graphql",
				-- "prismals",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same option as ensure_installed
		})
		mason_tool_installer.setup({
      -- list of formatters and linters for the mason tool to install
			ensure_installed = {
				-- "prettier", -- ts/js formatter (prettier formatter seems to be required)
        "clang-format", -- C/C++ formatter
        "fprettify", -- modern fortran formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"stylua", -- lua formatter
				-- "eslint_d", -- js linter
			},
		})
	end,
}
