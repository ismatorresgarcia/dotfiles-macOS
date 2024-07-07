-- import bufferline plugin safely
local bufferline_setup_ok, bufferline_imp = pcall(require, "bufferline")
if not bufferline_setup_ok then
	return
end

local highlights = require("nord").bufferline.highlights({
	italic = true,
	bold = true,
	fill = "#181c24",
})

bufferline_imp.setup({
	options = {
		mode = "buffers",
		separator_style = "thin",
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon", -- OR: 'underline' | 'none',
		},
		show_tab_indicators = true,
		show_close_icon = true,
		diagnostics = false, -- OR: 'nvim_lsp' | 'coc'
		diagnostics_update_in_insert = false,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		sort_by = "insert_at_end", -- OR: 'insert_after_current' | 'tabs' | 'extension' | 'relative_directory' | 'directory' | 'id' |
		offsets = {
			filetype = "NvimTree",
			text = function()
				return vim.fn.getcwd()
			end,
			highlight = "Directory",
			separator = "true", -- use a "true" to enable the default, or set your own character
		},
		hover = {
			enabled = true,
			delay = 30,
			reveal = { "close" },
		},
	},
})
