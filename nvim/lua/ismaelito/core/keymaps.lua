local opts = { noremap = true, silent = true }

-- Sustituyo el nombre de la función 'keymap' for 'key'
local key = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NOTE Check mapping with :verbose map ____

---------------------
-- General keys
---------------------

-- Set global leader key
vim.keymap.set("", "<Space>", "<NOP>")
vim.g.mapleader = " "

-- Elimino el resaltado de las búsquedas
key("n", "<CR>", ":nohl<CR>", opts)

-- Deshago mappings
key("n", "<C-z>", "<nop>", opts)
key("n", "gc", "<nop>", opts)
key("n", "gcc", "<nop>", opts)

-- Gramática
vim.keymap.set("n", "<C-s>", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
		previewer = false,
		layout_config = {
			width = 50,
			height = 15,
		},
	}))
end, { remap = true })

-- Buscar archivos del proyecto
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { remap = true })

-- Activar comentarios
key("n", "<C-Bslash>", "<Plug>(comment_toggle_linewise_current)", opts)
key("x", "<C-Bslash>", "<Plug>(comment_toggle_linewise_visual)", opts)

-- Abrir la ventana de ayuda sobre una palabra
key("n", "<S-m>", ':execute "help " . expand("<cword>")<cr>', opts)

-- Arreglo 'Y', 'E'
key("n", "Y", "y$", opts)
key("n", "E", "ge", opts)
key("v", "Y", "y$", opts)

-- Centrar el cursor
key("n", "m", "zz", opts)
key("v", "m", "zz", opts)

-- Moverse entra las ventanas y opciones
key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)

-- Ajustar tamaño con las flechas
key("n", "<A-Left>", ":vertical resize -2<CR>", opts)
key("n", "<A-Right>", ":vertical resize +2<CR>", opts)
key("n", "<A-h>", ":vertical resize -2<CR>", opts)
key("n", "<A-l>", ":vertical resize +2<CR>", opts)

-- Navegar entre buffers (con BS y TAB hacia atras y hacia delante)
key("n", "<TAB>", ":bnext<CR>", opts)
key("n", "<S-TAB>", ":bprevious<CR>", opts)
key("n", "<BS>", ":bnext<CR>", opts)
key("n", "<S-BS>", ":BufferLineMovePrev<CR>", opts)

-- Arrastrar líneas
key("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
key("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
key("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
key("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
key("v", "<A-j>", ":m'>+<CR>gv", opts)
key("v", "<A-k>", ":m-2<CR>gv", opts)

-- Movimiento en vertical en una línea (cuando la "línea" del código ocupa muchas líneas del display)
key("n", "<c-u>", "<c-u>zz", opts)
key("n", "<c-d>", "<c-d>zz", opts)

-- Movimiento en horizontal en una línea (cuando la "línea" del código ocupa muchas líneas del display)
key("v", "<S-h>", "g^", opts)
key("v", "<S-l>", "g$", opts)
key("n", "<S-h>", "g^", opts)
key("n", "<S-l>", "g$", opts)

-- Sangrados
key("v", "<", "<gv", opts)
key("v", ">", ">gv", opts)
key("n", "<", "<S-v><<esc>", opts)
key("n", ">", "<S-v>><esc>", opts)

-- Para navegar entre las líneas de display en vertical
key("n", "J", "gj", opts)
key("n", "K", "gk", opts)
key("v", "J", "gj", opts)
key("v", "K", "gk", opts)
