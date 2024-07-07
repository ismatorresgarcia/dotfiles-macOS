-- import null-ls plugin safely
local null_ls_setup_ok, null_ls_imp = pcall(require, "null-ls")
if not null_ls_setup_ok then
	return
end

-- for conciseness
local formatting = null_ls_imp.builtins.formatting --to setup formatters
--local diagnostics = null_ls_imp.builtins.diagnostics --to setup linters

-- To setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Configure null_ls
null_ls_imp.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.stylua,
		-- null_ls.builtins.diagnostics.cspell,
		-- null_ls.builtins.code_actions.cspell,
		null_ls_imp.builtins.completion.spell,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
