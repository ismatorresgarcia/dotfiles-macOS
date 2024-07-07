-- import comment plugin safely
local comment_setup_ok, comment_imp = pcall(require, "Comment")
if not comment_setup_ok then
  return
end

comment_imp.setup({
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---Function to call before (un)comment
  pre_hook = nil,
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = false,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = false,
  },
})

