if status is-interactive
  # Commands to run in interactive sessions can go here
  pyenv init - | source
end

# Set up `zoxide` key bindings
zoxide init fish | source

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
