. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/paths

if [ `uname` = "Darwin" ]; then
  . ~/.zsh/darwin/aliases
  . ~/.zsh/darwin/paths
elif [ `uname` = "Linux" ]; then
  . ~/.zsh/linux/aliases
  . ~/.zsh/linux/paths
fi

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
