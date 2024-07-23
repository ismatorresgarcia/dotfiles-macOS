-- CATPPUCCIN THEME
return {
  -- Install the theme with lazy nvim. The colorscheme should be available when starting Neovim
  "catppuccin/nvim",
  name = "catppuccin",
  --lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        markdown = true,
        mason = false,
        --mini = {
        --  enabled = true,
        --  indentscope_color = "",
        --},
        native_lsp = {
          enabled = true,
          virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
              ok = { "italic" },
          },
          underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
              ok = { "underline" },
          },
          inlay_hints = {
              background = true,
          },
        },
        nvim_surround = false,
        nvimtree = true,
        treesitter = true,
        treesitter_context = true,
        telescope = {
          enabled = true,

        },
        notify = false,
        which_key = false,
      }
    })
  -- Activate de theme. Load the colorscheme here
  vim.cmd("colorscheme catppuccin-macchiato")
  end,
}


