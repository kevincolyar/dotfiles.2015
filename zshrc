. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/paths

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
