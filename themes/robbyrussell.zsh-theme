PROMPT='$(parse_git_dirty)'
PROMPT+='%{$fg_bold[cyan]%}%c%{$reset_color%}'
PROMPT+='($(git_prompt_info)$(git_prompt_short_sha))%{$reset_color%}'
PROMPT+=' %(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})$(git_current_user_symbol)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg_bold[grey]%}#"

ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"
