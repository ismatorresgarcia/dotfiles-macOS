-- import mason plugin safely
local mason_setup_ok, mason_imp = pcall(require, "mason")
if not mason_setup_ok then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_setup_ok, mason_lspconfig_imp = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup_ok then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls_imp = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason_imp.setup()

mason_lspconfig_imp.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"pyright",
		"texlab",
		"lua_ls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls_imp.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
