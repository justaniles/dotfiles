# Justin Niles Custom Theme for Oh My Zsh
# See lib/spectrum.zsh for $FG color codes

PROMPT='%{$fg[cyan]%}[%~]%{$reset_color%}%{$fg[green]%}%B$%b%{$reset_color%} '

RPROMPT='$(git_prompt_info) $(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}[%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}A"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[208]%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}D"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[208]%}R"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}UU"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}??"