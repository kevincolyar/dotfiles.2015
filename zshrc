. ~/.zsh/oh-my-zsh
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/paths
. ~/.zsh/rvm

if [ `uname` = "Darwin" ]; then
  . ~/.zsh/darwin/aliases
  . ~/.zsh/darwin/paths
elif [ `uname` = "Linux" ]; then
  . ~/.zsh/linux/aliases
  . ~/.zsh/linux/paths

  # When on a remote linux box, change to 256 colors set correct ssh socket
  if [ "$TERM" = "screen" ]; then
    export TERM=screen-256color
    export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
  fi
fi
