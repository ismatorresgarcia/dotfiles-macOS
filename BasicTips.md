# Basic Information

The following sections present a list of keyboard shortcuts/macros and new features I have included in the NeoVim configuration I use. The idea is for this configuration to be used by people who need to write in LaTeX and take notes in Markdown. If you don’t know what LaTeX is, I recommend checking out these YouTube videos to get started quickly with LaTeX resources for learning [LaTeX](https://www.youtube.com/watch?v=VhmkLrOjLsw) and [Markdown](https://www.youtube.com/watch?v=hpAJMSS8pvs&t=574s).
If you're looking for default Vim macros and want to learn, check out this video [resource](https://vim.rtorr.com). Throughout this document, I will include more tutorials and video links but without diving into the typical traditional Vim commands, which remain the same as before.
If you are curious about Git and how it is used, there’s plenty of information in the file I’ve included LearningGit.md. There are also links and resources to learn more about Vim below.

## Table of Contents

1. [Learning Vim](#Learning-Vim)
2. [Mappings](#Mappings)
3. [Plugins](#Plugins)

# Learning Vim

NeoVim maintains the same modes, keyboard shortcuts, and philosophy as Vim and Vi, which are quite old (dating back to the 1970s). With some practice, using these conventions provides a powerful and efficient way to edit texts and documents, which is the core idea of NeoVim and the most interesting aspect of the editor.
Learning to use NeoVim is fast at first, but takes a bit of time and effort over a relatively short period, though it’s definitely worth it. Becoming skilled and an expert is a matter of years.
However, with just the basics, NeoVim already provides an incredible boost in efficiency, so from my perspective, the initial effort is definitely worth it. To dive into NeoVim, it would be good to check out these resources first:

Detailed Guide – A quick overview.
OpenVim – A fun interactive Vim tutorial.
VimAdventure – It’s like a game to learn basic Vim commands.
Vim Tutor – A walkthrough of the vimtutor tutorial.
Tutorial Series – A series of short video tutorials.
Orienting Remarks – Learning Vim is like learning touch-typing.
Another List – A step-by-step Vim learning blog.
Pure Zeal – Another guy obsessed with Vim.

- [Detailed Guide](https://danielmiessler.com/study/vim/) - A quick overview.
- [OpenVim](https://www.openvim.com/) A fun interactive Vim tutorial.
- [VimAdventure](https://vim-adventures.com/) It's like a game to learn basic Vim commands,
- [Vim Tutor](https://www.youtube.com/watch?v=d8XtNXutVto) A walkthrough of the "vimtutor" tutorial.
- [Tutorial Series](https://www.youtube.com/watch?v=H3o4l4GVLW0&t=1s) A series of short video tutorials.
- [Orienting Remarks](http://www.viemu.com/a-why-vi-vim.html) Learning Vim is like learning "touch-typing".
- [Another List](https://blog.joren.ga/tools/vim-learning-steps) A step-by-step Vim learning blog.
- [Pure Zeal](https://thevaluable.dev/vim-adept/) Another guy obsessed with Vim.

# Macros

The Which-key can be opened with the spacebar, which acts like a main menu with a set of keys mapped to special actions.
The macros I will explain in this section are those included in `~/.config/nvim/lua/ismael/core/keymaps.lua`, but later on, I will also explain the Which-key macros associated with the plugin itself.


## _Movement Between Lines_

- **Move lines**: The commands `alt-j` and `alt-k` move selected lines up or down in visual, normal, and insert modes, where the indentation is automatically adjusted.
- **Better indentation**: The keys `<` and `>` automatically adjust the indentation of lines in normal and visual modes.
- **Show line movements**: In both normal and visual modes, `shift-j` and `shift-k` move the cursor vertically within the selected lines on screen, while `shift-h` and `shift-l` move the cursor to the beginning or end of the selected line, respectively.


## _Windows, Files, and Panels_

- **Window management**: Use `<ctrl-a>c` to create a new window, and `<ctrl-a>k` to close the current window (make sure all active processes are closed before quitting NeoVim with `<space>q`).
- **Move between windows**: Use `<ctrl-a>n` and `<ctrl-a>p` to move between open windows.
- **Move between files**: Use `<bs>` and `<shift-a>` to move between open files.
- **Move between panels**: Use `<ctrl>h/j/k/l` to select different panels.
- **Resize panels**: Use `<alt>h/l` to adjust the selected panel horizontally.

## _Commands_

- **Save and Quit**: Use `<space>w` to save the current file, and `<space>q` to save and quit all open files.
- **Copy**: Use `Y` to copy to the end of the line.
- **Previous word**: Use `E` to move to the end of the previous word.
- **Comment**: In normal or visual mode, use `ctrl-\'  to uncomment previously selected lines.
- **Help**: Use `shift-m` to open help for the word under the cursor, and `q` to close it.
- **Multiple cursors**: Use `ctrl-n` to select the word under the cursor, and after selecting text in visual mode, `ctrl-n` will select subsequent matches of the word. `ctrl-x` skips the current match, and `ctrl-p` deselects the current match and goes back to the previous match of the word. Be cautious, as releasing `ctrl` and using `n` and `N` will work as usual. Additionally, right/left-clicking while holding `ctrl` will add a cursor or select a word.
- **Terminal**: Use `ctrl-t` to open a terminal window within NeoVim.
- **Export bibliography**: Use `<space>ab` to generate a bibliography locally from the citations in the current document.
- **Bibliography annotations**: Use `<space>aa` to generate a markdown file with annotations from the PDF associated with the citation under the cursor.

## _Skim Viewer_

- **Index**: Use `<space>` to activate the index.
- **Zoom**: Use `shift-k` and `shift-j` to zoom in and out, respectively.
- **Print**: Use `p` to print.
- **Normal mode**: Use `w` to disable the background color (if it’s enabled).
- **Synchronization**: Use `ctrl-[right click]` on a line in the .pdf when VimTeX has generated it to select the corresponding line in the code in NeoVim. To do it in reverse, use `<space>v` to select the line in the code in the .pdf.

# _Plugins_

Now let's talk about the "plugins" (additional packages) included in `~/.config/nvim/lua/ismael/plugins-setup.lua`, which are very important for specific tasks like writing in LaTeX (in fact, without plugins you couldn’t write in LaTeX).

## _File management_

- **Local file search**: Use `ctrl-p` to search for files tracked by Git in the project directory, navigate between them with `ctrl-j/k`, and open files with `Enter`.
- **Fuzzy file search**: Use `<space>ff` to activate a fuzzy search for all files in the project directory, navigate between them with `ctrl-j/k`, and open files with `Enter`.
- **File Explorer**: Use `<space>e` to open the file explorer, navigate between files with `j/k`, open files with `Enter`, close directories with `h/l`, add new directories with `shift-a`, add files with `a`, and open files with `Enter`.
- **Close Panels**: Use `<space>d` to close the current selected panel.
- **LazyGit**: Use `<space>gg` to open LazyGit, and then use `?` to view a list of available commands and actions, moving with `h/j/k/l`.
- **Branch**: Use `<space>fb` to search through different Git branches.
- **CWD**: Use `<space>au` to change the project directory to the directory of the current file.
- **Hunks**: Use `<space>gj` and `<space>gk` to navigate through the changes made since the last commit.
- **Blame**: Use `<space>gl` to see the person who made the last change to the line under the cursor.

## _Projects and Templates_

- **Projects**: Use `<space>ms` to create a new project, `<space>ml` to switch to a different project, and `<space>md` to delete the current project.
- **Templates**: Use `<space>t` to choose from templates stored in the `~/.config/nvim/templates directory`. To add new templates, add the new file in ~/.config/nvim/templates, modifying the directory in ~/.config/nvim/lua/ismael/plugins/whichkey.lua.

## _Autocompletion_

- **Select Entry**: Use `ctrl-j` and `ctrl-k` to navigate the autocompletion menu.
- **Activate Completion**: Continue typing after selecting an option or press `Enter`.
- **Activate Snippets**: Use `Enter` to activate the selected option, and `tab` to navigate between fields.
- **Go To**: Use `gd` to go to the definition of the word under the cursor (if available).
- **Grammar**: Use `ctrl-s` to find alternatives for misspelled words.

## _Autopairs and Surround _


- **Autopairs**: Use opening quotation marks/brackets to create a pair, and NeoVim will automatically insert the closing pair and position the cursor inside.
- **Add Surround**: In visual selection mode use `shift-s`, or in normal mode `<space>ss`, followed by the text you would like to insert, and then you must choose between:
  - `q/Q` for single/double quotation marks in LaTeX.
  - `i` for italics, `b` for bold, `t` for typescript, `s` for small-caps, `$` for in-line math enviroment. Left bracket/parenthesis/keys for padding, and right bracket/parenthesis/keys for no padding.
- **Change Surround**: in normal mode, use `<space>s` followed by:
  - `c` and the character you want to change (e.g., `}`), and then press the key for the new character you want to insert (e.g., `[`).
  - `d` and the character you want to eliminate (e.g., `i` if the cursor is placed anywhere inside `\textit{example}`, same for any other character).

## LaTeX

- **Compilation**: use `<space>b` to activate compilation in "continuous" mode (every time the .tex file is saved it will be recompiled automatically).
- **View**: use `<space>v` to see the selected line in the .pdf
- **Index**: use `<space>i` to add the index.
- **Counter**: use `<space>c` to count the number of words.
- **Errors**: use `<space>ar` to open the .log file in "horizontal" mode and `<space>d` to close it.
- **Clean**: use `<space>ac` to eliminate all the auxiliary files generated during compilation. 
- **Snippets**: use `<space>as` to edit the snippets files.
- **VimTeX**: use `<space>av` to see the .bib entry where the cursor is placed. You can decide to open and edit the .bib entry, etc.
- **Cite**: use `<space>fc` to search in the .bib which you have to include at the final part of your LaTeX document (normally the main.tex file).
- **Pandoc**: use `<space>p` to choose the file format in which you want to convert the previously opened file (where the window is currently at).

## _More Special Commands_

- **Undo**: use `<space>u` to open the "undo-tree".
- **Center**: use `m` (by default Vim does this with `zz`) to center the cursor in the middle of the screen.
- **Highligh**: use `Enter` to eliminate the highlighted search results.
- **LSP**: use `<space>af` to activate the LSP menu.
- **Python**: use `<space>ap` to execute the Python file currently opened.
- **Buffers**: use `<space>fb` to move between opened buffers.
- **Keymaps**: use `<space>fk` to have a look inside the `keymap.lua` configuration file.
- **Registers**: use `<space>fr` to navigate between previous register entries.
- **Themes**: use `<space>ft` to change between previously used themes (you have to set them individually in the `colorscheme.lua` folder).
- **Trash**: use `<space>fy` to paste something you have previously pasted.





