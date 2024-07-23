# Información básica

Las siguientes secciones presentan una lista de atajos de teclado/macros y novedades que he incluido en la configuración de NeoVim que utilizo.
La idea es que esta configuración la utilicen personas que necesiten escribir en LaTeX y tomar notas con Markdown. Si no sabes que es LaTeX, recomiendo mirar estos videos en YouTube para comenzar rápidamente con LaTeX [resources for learning LaTeX](https://www.youtube.com/watch?v=VhmkLrOjLsw) y con [Markdown](https://www.youtube.com/watch?v=hpAJMSS8pvs&t=574s).
Si lo que estás buscando son macros de teclado que vengan por defecto en Vim y aprender, mira este video [resource](https://vim.rtorr.com) out.
Durante todo el documento pondré más tutoriales y links a videos, pero sin entrar en los comandos típicos de Vim tradicionales que, en principio, la mayoría están igual que antes.
Si tienes curiosidad por buscar información sobre Git y cómo se utiliza, hay un porrón de información en el archivo que he incluido [LearningGit.md](https://github.com/benbrastmckie/.config/blob/master/LearningGit.md).
También hay links y recursos para aprender más Vim a continuación.

## Índice General

1. [Learning Vim](#Learning-Vim)
2. [Mappings](#Mappings)
3. [Plugins](#Plugins)

# Learning Vim

NeoVim mantiene los mismos modos, atajos de teclado y filosofía que Vim y Vi, que son bastante viejunos (1970).
Con algo de práctica, utilizar estas convenciones proporcionan una manera muy potente y eficiente de editar textos y documentos, que es la idea principal de NeoVim y lo más interesante del editor.
Aprender a utilizar NeoVim es rápido al principio y lleva bastante tiempo y esfuerzo durante un periodo de tempo más o menos corto, pero merece la pena. La habilidad y ser más experto es cosa ya de llevar muchos años.
Sin embargo, sólamente teniendo la idea básica, NeoVim ofrece un incremento de la eficiencia increíble, así que desde mi punto de vista el esfuerzo inicial merece la pena (bastante).
Para entrar en faena con el tema de NeoVim puro y duro, estaría bien mirarse primero estos recursos.

- [Detailed Guide](https://danielmiessler.com/study/vim/) Repasito rápido.
- [OpenVim](https://www.openvim.com/) Tutorial de Vim interactivo muy gracioso.
- [VimAdventure](https://vim-adventures.com/) Es como un juego para aprender los comandos de Vim básicos.
- [Vim Tutor](https://www.youtube.com/watch?v=d8XtNXutVto) Un paseo por el tutorial de `vimtutor`.
- [Tutorial Series](https://www.youtube.com/watch?v=H3o4l4GVLW0&t=1s) Una serie de video tutoriales cortos.
- [Orienting Remarks](http://www.viemu.com/a-why-vi-vim.html) Aprender Vim es como aprender a usar el típico "touch-type".
- [Another List](https://blog.joren.ga/tools/vim-learning-steps) Un blog curioso para aprender Vim paso a paso.
- [Pure Zeal](https://thevaluable.dev/vim-adept/) Otro tío obsesionado con Vim.

# Macros

El Which-key los abrís con la barra espaciadora, que es algo así como un menú principal con una serie de teclas vinculadas a acciones especiales.
Las macros que voy a contar en esta primera sección son los incluídos en `~/.config/nvim/lua/ismael/core/keymaps.lua`, pero bueno luego más adelante comentaré las macros de Which-key que están asociadas al plugin en sí mismo.

## _Movimientos entre líneas_

- **Arrastrar líneas**: los comandos `alt-j` y `alt-k` mueven las líneas seleccionadas arriba o abajo en modo visual, normal e insertar, donde el sangrado se ajusta automáticamente.
- **Mejores sangrados**: las teclas `<` y `>` ajustan automáticamente los sangrados de las líneas en modo normal y visual.
- **Mostrar los movimientos de líneas**: tanto en modo normal y visual, `shift-j` y `shift-k` desplazan en vertical el cursor en las líneas seleccionadas en pantalla, mientras que `shift-h` y `shift-l` moverán el cursor al principio o al final de la línea seleccionada, respectivamente.

## _Ventanas, Archivos y Paneles_

- **Gestión de ventanas**: utiliza `<ctrl-a>c` para crear una ventana nueva, y `<ctrl-a>k` para cerrar la ventana actual (vigila que todos los procesos activos estén cerrados, cerrando NeoVim con `<space>q`).
- **Moverse entre ventanas**: utiliza `<ctrl-a>n` y `<ctrl-a>p` para desplazarte en ventanas abiertas.
- **Moverse entre archivos**: utiliza `<bs>` y `<shift-a>` para moverte entre los archivos abiertos.
- **Moverse entre paneles**: utiliza `<ctrl>h/j/k/l` para seleccionar distintos paneles.
- **Ajustar paneles**: utiliza `<alt>h/l` para ajustar en horizontal el panel seleccionado.

## _Comandos_

- **Guardar y Salir**: utiliza `<space>w` para guardar el arhivo actual, y`<space>q` para guardar y salir de todos los archivos abiertos.
- **Copiar**: utiliza `Y` para copiar hasta el final de la línea.
- **Palabra Anterior**: utiliza `E` para ir hasta el final de la palabra anterior.
- **Comentar**: en modo normal o modo visual, utiliza `ctrl-\ ` para descomentar las líneas que estuvieran previamente seleccionadas.
- **Ayuda**: utiliza `shift-m` para abrir la Ayuda de la palabra donde esté el cursor, y `q` para cerrar.
- **Cursores Múltiples**: utiliza `ctrl-n` para seleccionar la palabra donde está el cursor y después de haber seleccionado un texto con el modo visual, donde repetir `ctrl-n` seleccionará las siguientes coincidencias de la palabra, `ctrl-x` se saltará la coincidencia seleccionada actual, y `ctrl-p` deselecciona la coincidencia actual y vuelve a la coincidencia anterior de la susodicha palabra inicial. Cuidado porque soltar `ctrl` y `n` y `N` funcionará como siempre. Adicionalmente, clicar con el ratón derecha/izquierda mientras mantienes pulsado `ctrl` añadirá un cursor o seleccionará una palabra.
- **Terminal**: utiliza `ctrl-t` para sacar una ventana con la terminal en NeoVim.
- **Exportar Bibliografía**: utiliza `<space>ab` para generar una bibliografía localmente a partir de las citaciones del documento actual.
- **Anotaciones de la Bibliografía**: utiliza `<space>aa` para generar un archivo 'markdown' con anotaciones a partir del pdf asociado a la citación donde el cursor esté situado.

## _Skim_

- **Índice**: utiliza `<space>` para activar el índice.
- **Zoom**: utiliza `shift-k` y `shift-j` para hacer aumentar y minizar el zoom, respectivamente.
- **Imprimir**: utiliza `p` para imprimir.
- **Modo Normal**: utiliza `w` para desactivar el color de fondo (si lo tienes activado).
- **Sincronización**: utiliza `ctrl-[right click]` en una línea del .pdf cuando VimTeX lo haya generado para seleccionar la línea correspondiente del código en NeoVim. Para hacerlo a la inversa, utiliza `<space>v` para seleccionar la línea del código en el .pdf.

# Plugins

Ahora toca hablar de los 'plugins' (como paquetes adicionales) incluídos en`~/.config/nvim/lua/ismael/plugins-setup.lua` que son muy importantes para la parte orientada a cosas más específicas como escribir en LaTeX (de hecho sin plugins no podrías escribir en LaTeX directamente.)

## _Gestión de Archivos_

- **Búsqueda de Archivos Locales**: utiliza `ctrl-p` para buscar archivos que estén siendo rastreados por Git en el directorio del proyecto donde te encuentres, navegar entre ellos con `ctrl-j/k`, y abrir los archivos con`Enter`.
- **Búsqueda con Fuzzy File**: utiliza `<space>ff` para activar un "fuzzy search" de todos los archivos en el directorio del proyecto donde te encuentres, navegar entre ellos con `ctrl-j/k`, y abrir los archivos con`Enter`.
- **Explorador**: utiliza `<space>e` para abrir el explorador de archivos, navegar entre ellos con`j/k`, abrir los archivos con y cerrar los directorios con `h/l`, añadir nuevos directorios con `shift-a`, añadir archivos con `a`, y abrir archivos con `Enter`.
- **Cerrar Paneles**: utiliza `<space>d` para cerrar el panel actual seleccionado.
- **LazyGit**: utiliza `<space>gg` para abrir LazyGit, y luego utiliza `?` para ver una lista de los distintos comandos y acciones, utilizando `h/j/k/l` para moverte.
- **Branch**: utiliza `<space>fb` para buscar entre las distintas ramas de Git.
- **CWD**: utiliza `<space>au` para cambiar el directorio del proyecto al directorio que contiene el archivo actual.
- **Hunks**: utiliza `<space>gj` y `<space>gk` para navegar entre los distintos cambias hechos desde el último commit.
- **Blame**: utiliza `<space>gl` para ver la persona que ha hecho el último cambio de la línea donde está el cursor.

## _Proyectos y Plantillas_

- **Proyectos**: utiliza `<space>ms` para crear un nuevo proyecto, `<space>ml` para cambiar a un proyecto diferente, y `<space>md` para eliminar el proyecto actual.
- **Plantillas**: utiliza `<space>t` para escoger algunas de las plantillas que están guardadas en el directorio `~/.config/nvim/templates`.
  - Si quieres añadir nuevas plantillas, añade el archivo nuevo en `~/.config/nvim/templates`, modificando el directorio en `~/.config/nvim/lua/ismael/plugins/whichkey.lua`.

## _Autocompletado_

- **Seleccionar Entrada**: utiliza `ctrl-j` y `ctrl-k` para moverte en el menú del autocompletado.
- **Activar Completado**: sigue escribiendo después de seleccionar la opción, o pulsa `Enter`.
- **Activar Snippets**: utiliza `Enter` para activar la opción seleccionada, y `tab` para moverte entre los distintos campos.
- **Go To**: utiliza `gd` para ir a la definición de la palabra donde se encuentra el cursor (si hay palabra).
- **Gramática**: utiliza `ctrl-s` para buscar alternativas de palabras que están mal escritas.

## _Autopairs y Surround _

- **Autopairs**: utiliza comillas/corchetes de apertura para crear una pareja, añadiendo un espacio si quieres, seguido por las comillas/corchetes de cierre.
- **Añadir Surround**: en modo selección visual utiliza `shift-s`, o en modo normal utiliza `<space>ss`, seguido del texto que quieras, y después puedes hacer:
  - `q/Q` para comillas simples/dobles en LaTeX, respectivamente.
  - `i` para cursiva, `b` para negrita, `t` para typescript, `s` para small-caps, `$` para meter un entorno matemático entre líneas, abre (izquierda) corchete/paréntesis/llaves para padding, y cierra (derecha) corchete/panréntesis/llaves para no hacer padding.
- **Cambiar Surround**: en modo normal, utiliza `<space>s` seguido de:
  - `c` seguido de la tecla con el caracter que quieres cambiar (e.g., `}`), y después la tecla para el nuevo caracter al que quieres cambiar (e.g., `[`).
  - `d` seguido de la tecla con el caracter que quieres eliminar (e.g., `i` si el cursor está en cualquier sitio de`\textit{example}`, e igual para cualquier otra tecla).

## _LaTeX_

- **Compilar**: utiliza `<space>b` para activar la compilación en modo continuo.
- **Ver**: utiliza `<space>v` para ver en el .pdf la línea seleccionada.
- **Índice**: utiliza `<space>i` para añadir el índice.
- **Contar**: utiliza `<space>c` para contar el número de palabras.
- **Registro de Errores**: utiliza `<space>ar` para abrir el .log de LaTeX en horizontal, y `<space>d` para cerrarlo.
- **Limpiar**: utiliza `<space>ac` para eliminar todos los archivos auxiliares generados por LaTeX.
- **Snippets**: utiliza `<space>as` para editar el archivo de los snippets.
- **VimTeX**: utiliza `<space>av` para ver la entrada del .bib donde está el cursor, con la opción de ver o editar el archivo .bib, abrir el arachivo, etc.
- **Citas**: utiliza `<space>fc` para buscar dentro del archivo .bib incluido al final del documento de LaTeX.
- **Pandoc**: utiliza `<space>p` para escoger el formato de archivo en el que te gustaría convertir el archivo que tengas actualmente abierto en un panel.

## _Más Atajos Especiales_

- **Deshacer**: utiliza `<space>u` para abrir el "undo-tree".
- **Centrado**: utiliza `m` para centrar la pantalla en el cursor.
- **Resaltar**: utiliza `Enter` para eliminar los resultados de búsqueda resaltados.
- **HTOP**: utiliza `<space>ah` para abrir el `htop` del sistema.
- **Illuminate**: utiliza `<space>ai` para activar el "resaltado" de todas las palabras iguales a la que está bajo el cursor.
- **LSP**: utiliza `<space>al` para activar el menú del autocompletado.
- **Símbolo**: utiliza `<space>ap` para generar el símbolo matemático bajo el cursor.
- **Paneles**: utiliza `<space>fb` para moverte en paneles abiertos.
- **Keymaps**: utiliza `<space>fk` para buscar entre las combinaciones de teclado que tengas configuradas.
- **Registros**: utiliza `<space>fr` para buscar entre los registros anteriores.
- **Temas**: utiliza `<space>ft` para cambiar entre los temas guardados.
- **Papelera**: utiliza `<space>fy` para pegar anteriores cosas pegadas también.
