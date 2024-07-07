-- NORD THEME --

-- Asigno el tema a una variable local y la llamo con 'pcall' como medida de seguridad, por si acaso no está instalado
local colorscheme_setup_ok, _ = pcall(vim.cmd, "colorscheme nord")
if not colorscheme_setup_ok then
	print("Colorscheme not found!") -- aparece este mensaje si hay un error al cargar el tema
	return
end
