. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/paths
. ~/.zsh/oh-my-zsh

if [ `uname` = "Darwin" ]; then
  . ~/.zsh/darwin/aliases
  . ~/.zsh/darwin/paths
elif [ `uname` = "Linux" ]; then
  . ~/.zsh/linux/aliases
  . ~/.zsh/linux/paths
fi

