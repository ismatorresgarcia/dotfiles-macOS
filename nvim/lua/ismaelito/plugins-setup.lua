local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local packer_status_ok, packer_imp = pcall(require, "packer")
if not packer_status_ok then
	return
end

-- Have packer use a popup window
packer_imp.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Packer
return packer_imp.startup(function(use)
	-- Have packer manage itself
	use({ "wbthomason/packer.nvim" })
	-- Useful lua functions used by lots of plugins
	use({ "nvim-lua/plenary.nvim" })

	-- General
	use({ "numToStr/Comment.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "kylechui/nvim-surround" })

	-- Mappings
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 200
		end,
	})

	-- Terminal
	use({ "akinsho/toggleterm.nvim" })

	-- File Management
	use({ "kyazdani42/nvim-web-devicons" }) -- VS-Code like icons for the nvim-tree
	use({ "kyazdani42/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"Shatur/neovim-session-manager",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
	})

	-- Appearance
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({ "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons" }) -- Bottom lua status line
	use({
		"goolord/alpha-nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"Shatur/neovim-session-manager",
		},
	})
	use({ "RRethy/vim-illuminate" })

	-- Colorschemes
	--use({ "folke/tokyonight.nvim" })
	use({ "shaunsingh/nord.nvim" })

	-- Autocompletion for nvim
	use({ "hrsh7th/nvim-cmp" })
	-- buffer completions
	use({ "hrsh7th/cmp-buffer" })
	-- path completions
	use({ "hrsh7th/cmp-path" })
	-- snippet completions
	use({ "saadparwaiz1/cmp_luasnip" })
	-- command completions
	use({ "hrsh7th/cmp-cmdline" })
	-- spelling completions
	use({ "f3fora/cmp-spell" })
	-- helps Vimtex completions
	use({ "hrsh7th/cmp-omni" })

	-- LSP
	-- managing & installing lsp servers, linters & formatters
	use({
		"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use({ "williamboman/mason-lspconfig.nvim" }) -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use({ "neovim/nvim-lspconfig" }) -- easily configure language servers
	--use({ "hrsh7th/cmp-nvim-lsp" }) -- for autocompletion

	-- formatting & linting
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- configure formatters & linters
	use({ "jay-babu/mason-null-ls.nvim" }) -- bridges gap b/w mason & null-ls

	-- LaTeX
	use({ "lervag/vimtex" }) -- essential for LaTeX; Vimscript
	use({ "kdheepak/cmp-latex-symbols" })
	use({ "jbyuki/nabla.nvim" }) -- show symbols in editor

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	-- Fuzzy finding w/ Telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.8", requires = "nvim-lua/plenary.nvim" })
	use({ "stevearc/dressing.nvim" })
	use({
		"nvim-telescope/telescope-bibtex.nvim",
		config = function()
			require("telescope").load_extension("bibtex")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
