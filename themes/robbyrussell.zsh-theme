PROMPT='$(git_prompt_info)$(git_prompt_short_sha)'
PROMPT+='%{$fg_bold[cyan]%}%c%{$reset_color%}'
PROMPT+=' %(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SHA_BEFORE+="%{$fg_bold[grey]%}"

ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}%{$fg[blue]%}]"
ZSH_THEME_GIT_PROMPT_SHA_AFTER+="%{$reset_color%} "
