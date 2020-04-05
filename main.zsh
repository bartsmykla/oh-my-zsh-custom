SCRIPT_DIR=$(dirname "${(%):-%N}")

function git_is_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    case "$GIT_STATUS_IGNORE_SUBMODULES" in
      git)
        # let git decide (this respects per-repo config in .gitmodules)
        ;;
      *)
        # if unset: ignore dirty submodules
        # other values are passed to --ignore-submodules
        FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"
        ;;
    esac
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  echo ${STATUS}
}

function git_prompt() {
  local branch="$(git_prompt_info)"
  local sha="$(git_prompt_short_sha)"
  local prompt="${branch}${sha}"

  [[ ! -z "${prompt}" ]] && prompt+="$ZSH_THEME_GIT_PROMPT_SHA_AFTER"

  echo "${prompt}"
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  local SHA
  SHA=$(command git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA"
}

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function git_success_user_symbol() {
  source "${SCRIPT_DIR}/symbols.zsh"
  local user_email="$(git config user.email 2>/dev/null)"
  local symbol="${SYMBOLS[${user_email}:SUCCESS]}"

  echo ${symbol:='%{$fg_bold[green]%}:%{$reset_color%}'}
}

function git_failure_user_symbol() {
  source "${SCRIPT_DIR}/symbols.zsh"
  local user_email="$(git config user.email 2>/dev/null)"
  local symbol="${SYMBOLS[${user_email}:FAILURE]}"

  echo ${symbol:='%{$fg_bold[red]%}:%{$reset_color%}'}
}
