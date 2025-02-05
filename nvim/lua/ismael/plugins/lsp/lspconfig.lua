-- LSP
-- configuration of the language server protocols known as 'lsp'
return {
  "neovim/nvim-lspconfig", -- easily configure language servers in neovim
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- for autocompletion
    { "antosha417/nvim-lsp-file-operations", config = true }, -- for file operations using lsp support
  },
  config = function()
    local lspconfig = require("lspconfig") -- import lspconfig plugin safely
    local cmp_nvim_lsp = require("cmp_nvim_lsp") -- import cmp-nvim-lsp plugin safely

    -- used to enable autocompletion (assign to every lsp server config)
    local default = cmp_nvim_lsp.default_capabilities() -- Variable used to enable autocompletion (assign to every lsp server config)
    local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" } -- Change the diagnostic symbols in the sign column (gutter)

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure C and C++ server
    lspconfig["clangd"].setup({
      capabilities = default,
    })
    -- configure fortran server
    lspconfig["fortls"].setup({
      capabilities = default,
    })
    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = default,
    })
    -- configure lua server (with special settings)
    --lspconfig["lua_ls"].setup({
    --	capabilities = default,
    --	settings = {
    --		-- custom settings for lua
    --		Lua = {
    --			-- make the language server recognize "vim" global
    --			diagnostics = {
    --				globals = { "vim" },
    --			},
    --			workspace = {
    --				-- make language server aware of runtime files
    --				library = {
    --					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
    --					[vim.fn.stdpath("config") .. "/lua"] = true,
    --				},
    --			},
    --		},
    --	},
    --})
  end,
}
