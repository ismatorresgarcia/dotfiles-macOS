-- import the nvim-cmp plugin safely
local cmp_setup_ok, cmp = pcall(require, "cmp")
if not cmp_setup_ok then
	return
end

-- import the luasnip plugin safely
local snip_setup_ok, luasnip = pcall(require, "luasnip")
if not snip_setup_ok then
	return
end

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

--   פּ ﯟ   iconos guapos para las sugerencias del autocompletado
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	-- preselect = cmp.PreselectMode.None,
	completion = {
		-- autocomplete = {
		--   cmp.TriggerEvent.TextChanged,
		--   cmp.TriggerEvent.InsertEnter,
		-- },
		completeopt = "menu,noselect",
		-- completeopt = "menuone,noinsert,noselect",
		keyword_length = 1,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Para la gente que utiliza 'LuaSnip' como yo
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		-- Set `select` to `false` to only confirm selected
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			-- if cmp.visible() then
			--   cmp.select_prev_item()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- Esto es para concatenar iconos con el mismo nombre que tipo de item
			vim_item.menu = ({
				-- omni = "[VimTex]",
				omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				spell = "[Spell]",
				latex_symbols = "[Symbols]",
				cmdline = "[CMD]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "omni" },
		{ name = "buffer", keyword_length = 3 },
		{
			name = "spell",
			keyword_length = 4,
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
		{
			name = "latex_symbols",
			filetype = { "tex", "latex" },
			option = { cache = true }, -- evitar recargar cada vez que haces algo
		},
		{ name = "path" },
	}),
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	view = {
		entries = "custom",
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	performance = {
		trigger_debounce_time = 500,
		throttle = 550,
		fetching_timeout = 80,
	},
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})
