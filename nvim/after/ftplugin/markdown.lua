-- import surround plugin safely
local surround_buffer_ok, nvim_surround_mark = pcall(require, "nvim-surround")
if not surround_buffer_ok then
  return
end

nvim_surround_mark.buffer_setup({
  surrounds = {
    ["e"] = {
      add = function()
        local env = require("nvim-surround.config").get_input ("Environment: ")
        return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
      end,
    },
    ["b"] = {
      add = { "**", "**" },
      find = "**.-**",
      delete = "^(**)().-(**)()$",
    },
    ["i"] = {
      add = { "*", "*" },
      find = "*.-*",
      delete = "^(*)().-(*)()$",
    },
  },
})
