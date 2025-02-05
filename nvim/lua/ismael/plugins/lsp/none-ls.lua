-- LSP
-- setup formatters & linters
return {
  "nvimtools/none-ls.nvim", -- configure linters and formatters
  lazy = true,
  ft = { "lua", "c", "cpp", "f90", "py", "js", "ts", "html" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
    "jay-babu/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")
    mason_null_ls.setup({
      ensure_installed = {
        "clang-format", -- C and C++ formatter
        "fprettify", -- modern fortran formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        --"yapf", -- python formatter
        "pylint", -- python linter
      },
      automatic_installation = true,
      handlers = {},
    })

    -- declare local variables for conciseness
    local null_ls = require("null-ls") -- import null-ls plugin safely
    local null_ls_utils = require("null-ls.utils") -- for conciseness
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- to setup format on save
    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      debug = true,
      log = {
        enable = true,
        level = "trace",
        use_console = false,
      },
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      -- setup formatters & linters
      sources = {
        --- Lua filetypes
        -- formatting.stylua,
        formatting.stylua.with({ -- lua formatter
          extra_args = {
            "--quote-style",
            "AutoPreferDouble",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        }),
        --- C and C++ filetypes
        -- formatting.clang_format, -- C/C++ formatter
        formatting.clang_format.with({
          extra_args = { "--style=file", vim.fn.expand("~/Documents/Projects/Cpp/clang_format") },
        }),
        --- Fortran filetypes
        formatting.fprettify, -- modern fortran formatter
        --- Python filetypes
        --formatting.isort,
        formatting.isort.with({ -- python formatter
          extra_args = { "--profile", "black" },
        }),
        --formatting.black,
        formatting.black.with({ -- python formatter
          extra_args = { "--fast", "--line-length", "88" },
        }),
        -- formatting.yapf, -- python formatter
        --diagnostics.pylint, -- instead of below
        diagnostics.pylint.with({
          extra_args = {
            "--output-format=text",
            "--msg-template={line}:{column}:{category}:{msg}",
            "--score=no",
          },
          diagnostics_format = "#{m} (#{c})",
        }),
        --diagnostics.pylint.with({ --python linter
        --	prefer_local = "~/.virtualenvs/pyvim/bin/pylint",
        --}),
      },
      -- -- configure format on save: uncomment augroup above
      -- on_attach = function(current_client, bufnr)
      --   if current_client.supports_method("textDocument/formatting") then
      --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       group = augroup,
      --       buffer = bufnr,
      --       callback = function()
      --         vim.lsp.buf.format({
      --            -- only use null-ls for formatting instead of lsp server
      --           filter = function(client)
      --             return client.name == "null-ls"
      --           end,
      --           async = false
      --         })
      --       end,
      --     })
      --   end
      -- end,
    })
  end,
}
