-- LSP
-- setup formatters & linters 
return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	lazy = true,
	ft = { "c", "cpp", "f90", "py", "html", "js", "ts", "lua" },
	event = { "BufReadPre", "BufNewFile" },
dependencies = {
		"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
		"jay-babu/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		mason_null_ls.setup({
			-- "prettier", -- ts/js formatter
      "clang-format", -- C/C++ formatter
      "fprettify", -- modern fortran formatter
			"isort", -- python formatter
			"black", -- python formatter
			"pylint", -- python linter
			"stylua", -- lua formatter
			-- "eslint_d", -- js linter
		})

		-- declare local variables for conciseness
		local null_ls = require("null-ls") -- import null-ls plugin safely
		local null_ls_utils = require("null-ls.utils") -- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			-- setup formatters & linters
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				-- formatting.prettier.with({ TURN ON FOR JAVA SCRIPT
				--   extra_filetypes = { "svelte" },
				--   disabled_filetypes = { "txt" },
				-- }),                -- js/ts formatter
        formatting.clang_format.with({
          extra_args = { "--style=file", vim.fn.expand("~/Documents/Proyectos/C++/clang_format") },
        }),
        formatting.fprettify, -- modern fortran formatter
				formatting.isort, -- python formatter
				formatting.black, -- python formatter
				diagnostics.pylint, --python linter
				formatting.stylua, -- lua formatter
				-- .with({
				--   extra_args = { "--config-path", vim.fn.expand("~/.nix-profile/bit/z3") },
				-- }),
				-- diagnostics.eslint_d.with({ -- TURN ON FOR JAVA SCRIPT
				--   -- js/ts linter
				--   condition = function(utils)
				--     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
				--   end,
				-- }),
			},
			-- -- configure format on save: uncomment augroup above
			-- on_attach = function(current_client, bufnr)
			--   if current_client.supports_method("textDocument/formatting") then
			--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			--     vim.api.nvim_create_autocmd("BufWritePre", {
			--       group = augroup,
			--       buffer = bufnr,
			--       callback = function()
			--         vim.lsp.buf.format({
			--            -- only use null-ls for formatting instead of lsp server
			--           filter = function(client)
			--             return client.name == "null-ls"
			--           end,
			--           async = false
			--         })
			--       end,
			--     })
			--   end
			-- end,
		})
	end,
}
