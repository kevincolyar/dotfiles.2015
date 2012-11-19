. ~/.zsh/oh-my-zsh
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/paths
. ~/.zsh/rvm

# When on a remote linux box, change to 256 colors
if [ "$TERM" = "screen" ]; then
  export TERM=screen-256color
fi
