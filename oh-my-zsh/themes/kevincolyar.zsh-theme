local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local separator="%{$fg[yellow]%}│%{$reset_color%}"
local git_branch='$(git_prompt_info)'

if [[ -s ~/.rvm/scripts/rvm ]] ; then
  local rvm_ruby='%{$fg[red]%}$(~/.rvm/bin/rvm-prompt i v g)%{$reset_color%}'
else
  local rvm_ruby=''
fi

RPS1="${user_host}${separator}${current_dir}${separator}${rvm_ruby}${separator}${git_branch}%"
PROMPT="%{$fg[green]%}>%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
