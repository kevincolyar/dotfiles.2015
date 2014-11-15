# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

. ~/.zsh/aliases
. ~/.zsh/config
. ~/.zsh/paths
. ~/.zsh/rbenv

