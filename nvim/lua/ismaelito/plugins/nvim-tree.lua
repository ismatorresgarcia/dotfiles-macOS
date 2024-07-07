-- import nvim-tree plugin safely
local nvimtree_setup_ok, nvim_tree_imp = pcall(require, "nvim-tree")
if not nvimtree_setup_ok then
	return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Activo la opción los colores de 24-bits
vim.opt.termguicolors = true

local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local key = vim.keymap.set

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Atajos por defecto
	api.config.mappings.default_on_attach(bufnr)

	-- Atajos personalizados
	key("n", "<CR>", api.node.open.tab, opts("Open"))
	key("n", "<S-M>", api.node.show_info_popup, opts("Info"))
	key("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	key("n", "l", api.node.open.edit, opts("Open"))
	key("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	key("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	key("n", "-", api.tree.change_root_to_parent, opts("Up"))
	key("n", "a", api.fs.create, opts("Create"))
	key("n", "y", api.fs.copy.node, opts("Copy"))
	key("n", "d", api.fs.remove, opts("Delete"))
	key("n", "D", api.fs.trash, opts("Trash"))
	key("n", "?", api.tree.toggle_help, opts("Help"))
	key("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	key("n", "p", api.fs.paste, opts("Paste"))
	key("n", "O", api.node.navigate.parent, opts("Parent Directory"))
	key("n", "q", api.tree.close, opts("Close"))
	key("n", "r", api.fs.rename, opts("Rename"))
	key("n", "R", api.tree.reload, opts("Refresh"))
	key("n", "o", api.node.run.system, opts("System Open"))
	key("n", "s", api.tree.search_node, opts("Search"))
	key("n", "v", api.node.open.vertical, opts("Vertical Split"))
	key("n", "x", api.fs.cut, opts("Cut"))
	key("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
end

nvim_tree_imp.setup({
	on_attach = on_attach,
	actions = {
		open_file = {
			quit_on_open = true,
			eject = true,
			resize_window = true,
			window_picker = {
				enable = true,
				picker = "default",
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		change_dir = {
			enable = false,
			global = false,
			restrict_above_cwd = false,
		},
		use_system_clipboard = true,
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	git = {
		enable = true,
		show_on_dirs = true,
		disable_for_dirs = {},
		timeout = 500,
		cygwin_support = false,
	},
	filters = {
		git_ignored = false,
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		no_bookmark = false,
		exclude = {},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		update_root = true,
		ignore_list = {},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		indent_width = 2,
		special_files = {},
		symlink_destination = true,
		highlight_git = false,
		highlight_diagnostics = false,
		root_folder_label = ":t",
		highlight_opened_files = "none",
		highlight_modified = "none",
		highlight_bookmarks = "none",
		highlight_clipboard = "name",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				bottom = "─ ",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "before",
			modified_placement = "after",
			diagnostics_placement = "signcolumn",
			bookmarks_placement = "signcolumn",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
				modified = true,
				diagnostics = true,
				bookmarks = false,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				folder = {
					--arrow_open = "󰚶",
					--arrow_closed = "󰨃",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "➜",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "✗",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	hijack_cursor = false,
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	select_prompts = false,
	sort = {
		sorter = "name",
		folders_first = true,
		files_first = false,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		width = 30,
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	system_open = {
		cmd = "",
		args = {},
	},
	modified = {
		enable = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	trash = {
		cmd = "gio trash",
	},
	tab = {
		sync = {
			open = false,
			close = false,
			ignore = {},
		},
	},
	notify = {
		threshold = vim.log.levels.ERROR,
		absolute_path = true,
	},
	help = {
		sort_by = "key",
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
			default_yes = true,
		},
	},
	experimental = {},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
})
