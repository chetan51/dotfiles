source ~/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load bundles.
antigen bundle fasd
antigen bundle gitfast
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-autosuggestions
antigen bundle molovo/tipz
antigen bundle bgnotify

# Load autocompletion plugins.
antigen bundle gibo-completion

# Load the theme.
antigen theme frmendes/geometry

# Tell antigen that you're done.
antigen apply

# Set editor to VS Code.
export EDITOR=code

# Customize prompt.
GEOMETRY_COLOR_DIR="magenta"
PROMPT_GEOMETRY_EXEC_TIME=true
GEOMETRY_PLUGIN_SEPARATOR=" "

# Import bindings.
source ~/.dotfiles/zsh/bindings

# Import functions.
source ~/.dotfiles/zsh/functions

# Import aliases.
source ~/.dotfiles/zsh/aliases

# Load autosuggestions.
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Allow autocompleting to special directories (like ../)
zstyle ':completion:*' special-dirs true

# NOTE: This theme was disabled because it's too slow
# antigen theme bhilburn/powerlevel9k powerlevel9k
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time vi_mode)
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# 1OWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
