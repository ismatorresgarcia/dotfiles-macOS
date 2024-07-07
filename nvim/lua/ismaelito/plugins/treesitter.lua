-- import treesitter plugin safely
local treesitter_setup_ok, treesitter_imp = pcall(require, "nvim-treesitter.configs")
if not treesitter_setup_ok then
	return
end

-- configure treesitter
treesitter_imp.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"c",
		"python",
		"bibtex",
		"markdown",
		"markdown_inline",
		"lua",
		"vim",
		"lua",
		"yaml",
		"perl",
		"json",
		"html",
		"haskell",
		"gitignore",
	},
})
