source ~/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load bundles.
antigen bundle autoenv
antigen bundle fasd
antigen bundle gitfast
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-autosuggestions

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell antigen that you're done.
antigen apply

# Set editor to VS Code.
export EDITOR=code

# Customize prompt.
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time vi_mode)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Import bindings.
source ~/.dotfiles/zsh/bindings

# Import functions.
source ~/.dotfiles/zsh/functions

# Import aliases.
source ~/.dotfiles/zsh/aliases
