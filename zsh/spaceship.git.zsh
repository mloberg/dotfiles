#
# Git prompt info
#
# Simplified git prompt info

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW=true}"
SPACESHIP_GIT_PREFIX="${SPACESHIP_GIT_PREFIX="on "}"
SPACESHIP_GIT_SUFFIX="${SPACESHIP_GIT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_SYMBOL="${SPACESHIP_GIT_SYMBOL=" "}"
SPACESHIP_GIT_SYMBOL_AHEAD="${SPACESHIP_GIT_SYMBOL_AHEAD="↑"}"
SPACESHIP_GIT_SYMBOL_BEHIND="${SPACESHIP_GIT_SYMBOL_BEHIND="↓"}"
SPACESHIP_GIT_SYMBOL_CLEAN="${SPACESHIP_GIT_SYMBOL_CLEAN="✓"}"
SPACESHIP_GIT_SYMBOL_DIRTY="${SPACESHIP_GIT_SYMBOL_DIRTY="✗"}"
SPACESHIP_GIT_STATUS_PREFIX="${SPACESHIP_GIT_STATUS_PREFIX=" ["}"
SPACESHIP_GIT_STATUS_SUFFIX="${SPACESHIP_GIT_STATUS_SUFFIX="] "}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_simplified() {
  [[ $SPACESHIP_GIT_REMOTE_SHOW == false ]] && return

  local git_branch git_upstream git_ahead git_behind git_status git_status_color

  git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

  [[ -z $git_branch ]] && return

  git_upstream=$(git for-each-ref --format='%(upstream:short)' "refs/heads/${git_branch}")

  if [[ -n "$git_upstream" && -n $(git branch --all --list "${git_upstream}" 2>/dev/null) ]]; then
    git_ahead=$(git rev-list "${git_upstream}..${git_branch}" | wc -l | tr -d ' ')
    git_behind=$(git rev-list "${git_branch}..${git_upstream}" | wc -l | tr -d ' ')

    [[ $git_ahead -gt 0 ]] && git_ahead="${SPACESHIP_GIT_SYMBOL_AHEAD}$git_ahead" || git_ahead=""
    [[ $git_behind -gt 0 ]] && git_behind="${SPACESHIP_GIT_SYMBOL_BEHIND}$git_behind" || git_behind=""
  fi

  git_status_color="green"
  git_status="${SPACESHIP_GIT_SYMBOL_CLEAN}"
  if [[ -n "$(git status --short)" ]]; then
    git_status_color="red"
    git_status="${SPACESHIP_GIT_SYMBOL_DIRTY}"
  fi

  # prefix
  spaceship::section \
    "white" \
    "$SPACESHIP_GIT_PREFIX"

  # branch
  spaceship::section \
    "magenta" \
    "$SPACESHIP_GIT_SYMBOL$git_branch"

  # status
  spaceship::section \
    "$git_status_color" \
    "$SPACESHIP_GIT_STATUS_PREFIX"\
    "$git_status$git_ahead$git_behind" \
    "$SPACESHIP_GIT_STATUS_SUFFIX" \
    "$SPACESHIP_GIT_SUFFIX"
}
