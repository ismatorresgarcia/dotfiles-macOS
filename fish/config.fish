if status is-interactive
  # Commands to run in interactive sessions can go here
  pyenv init - | source
end

# Set up `zoxide` key bindings
zoxide init fish | source

# Set `Catppuccin Macchiato` color options for `hydro` theme
set -g hydro_color_pwd 8aadf4 #blue
set -g hydro_color_git f0c6c6 #maroon
set -g hydro_color_error ed8796 #red
set -g hydro_color_prompt c6a0f6 #purple
set -g hydro_color_duration a6da95 #green
set -g hydro_multiline true

# Set up the theme `Catppuccin Macchiato` for `fzf`
set -g FZF_DEFAULT_OPTS "\
--color=spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--multi"

# Set up the colors for `fd` with `vivid`
set -g LS_COLORS "$(vivid generate catppuccin-macchiato)"

# Created by `pipx` on 2024-07-23 15:16:35
set PATH $PATH /Users/ytoga/.local/bin
