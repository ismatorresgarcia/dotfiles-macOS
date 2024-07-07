-- import impatient plugin safely
local impatient_setup_ok, impatient_imp = pcall(require, "impatient")
if not impatient_setup_ok then
  return
end

impatient_imp.enable_profile()
