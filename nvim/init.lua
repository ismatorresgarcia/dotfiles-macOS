-- GENERAL
require("ismaelito/plugins-setup")
require("ismaelito/core/options")
require("ismaelito/core/keymaps")
require("ismaelito/core/colorscheme")
require("ismaelito/core/autocommands")

-- PLUGINS
require("ismaelito/plugins/comment")
require("ismaelito/plugins/impatient")
require("ismaelito/plugins/surround")
require("ismaelito/plugins/undotree")

-- Mappings
require("ismaelito/plugins/whichkey")

-- Terminal
require("ismaelito/plugins/toggleterm")

-- File Management
require("ismaelito/plugins/nvim-tree")
require("ismaelito/plugins/sessions")

-- Appearance
require("ismaelito/plugins/bufferline")
require("ismaelito/plugins/lualine")
require("ismaelito/plugins/alpha")
require("ismaelito/plugins/illuminate")

-- Autocompletion with nvim-cmp
require("ismaelito/plugins/nvim-cmp")

-- LaTeX
require("ismaelito/plugins/vimtex")

-- Snippets
require("ismaelito/plugins/luasnip")

-- Telescope
require("ismaelito/plugins/telescope")
require("ismaelito/plugins/dressing")

-- LSP
require("ismaelito/plugins/lsp.mason")
require("ismaelito/plugins/lsp.lspconfig")
require("ismaelito/plugins/lsp.null-ls")

-- Treesitter
require("ismaelito/plugins/treesitter")

-- Git
require("ismaelito/plugins/gitsigns")

-- Inserto la configuración para los diccionarios.
-- Important: make sure to set mapleader before sourcing my_spell,
-- so that my_spell mappings use the correct leader key.
require("personal/spell/my_spell")
