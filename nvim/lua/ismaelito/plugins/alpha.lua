-- import alpha plugin safely
local alpha_setup_ok, alpha_imp = pcall(require, "alpha")
if not alpha_setup_ok then
	return
end
--
-- La pantalla de bienvenida para NeoVim
local dashboard = require("alpha.themes.dashboard")

local logo = {
	[[                                                    ]],
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	[[                                                    ]],
}

local cita = {
	[[ "Two things are infinite: the universe and human   ]],
	[[  stupidity; and I'm not sure about the universe."  ]],
	[[                                                    ]],
	[[                                  -Albert Einstein  ]],
}

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = "Include"

dashboard.section.buttons.val = {
	dashboard.button("s", "  Sessions", "<cmd>SessionManager load_session<CR>"),
	dashboard.button("r", "  Recent", ":Telescope oldfiles <CR>"),
	dashboard.button("e", "󰱼  Explorer", "<cmd>NvimTreeToggle<CR>"),
	dashboard.button("f", "  Find", ":Telescope find_files <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("i", "  CheatSheet", "<cmd>e ~/.config/CheatSheet.md<cr>"),
	dashboard.button("p", "  Plugins", "<cmd>PackerUpdate<cr>"),
	dashboard.button("h", "  Checkhealth", "<cmd>checkhealth<cr>"),
	dashboard.button("q", "  Quit", "<cmd>qa!<CR>"),
}
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.section.footer.val = cita
dashboard.section.footer.opts.hl = "Type"

alpha_imp.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
]])
