black="\[\e[0;30m\]"
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
purple="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[0;37m\]"
orange="\[\e[0;91m\]"

bold_black="\[\e[30;1m\]"
bold_red="\[\e[31;1m\]"
bold_green="\[\e[32;1m\]"
bold_yellow="\[\e[33;1m\]"
bold_blue="\[\e[34;1m\]"
bold_purple="\[\e[35;1m\]"
bold_cyan="\[\e[36;1m\]"
bold_white="\[\e[37;1m\]"
bold_orange="\[\e[91;1m\]"

underline_black="\[\e[30;4m\]"
underline_red="\[\e[31;4m\]"
underline_green="\[\e[32;4m\]"
underline_yellow="\[\e[33;4m\]"
underline_blue="\[\e[34;4m\]"
underline_purple="\[\e[35;4m\]"
underline_cyan="\[\e[36;4m\]"
underline_white="\[\e[37;4m\]"
underline_orange="\[\e[91;4m\]"

background_black="\[\e[40m\]"
background_red="\[\e[41m\]"
background_green="\[\e[42m\]"
background_yellow="\[\e[43m\]"
background_blue="\[\e[44m\]"
background_purple="\[\e[45m\]"
background_cyan="\[\e[46m\]"
background_white="\[\e[47;1m\]"
background_orange="\[\e[101m\]"

normal="\[\e[0m\]"
reset_color="\[\e[39m\]"

function ruby_version_prompt() {
    test ! $(which ruby) && return
    echo -e "ruby $(ruby -e "puts RUBY_VERSION")|"
}

function python_version_prompt() {
    test ! $(which python) && return
    echo -e "python $(python -c "import sys;print('%s.%s.%s' % sys.version_info[:3])")|"
}

function php_version_prompt() {
    test ! $(which php) && return
    echo -e "php $(php -r 'print phpversion();')|"
}

function node_version_prompt() {
    test ! $(which node) && return
    echo -e "node $(node --version | tr -d '\n\r' | tail -c +2)|"
}

function virtual_env_prompt() {
    test ! "$VIRTUAL_ENV" && return
    echo -e "($(basename $VIRTUAL_ENV))"
}

function git_prompt() {
  GIT_BRANCH=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  [ -z "$GIT_BRANCH" ] && return

  GIT_TRACK=""
  GIT_STATE=${GIT_PROMPT_CLEAN}

  if [ ! -z "$(git status --short)" ]; then
    GIT_STATE=${GIT_PROMPT_DIRTY}
  fi

  upstream=$(git for-each-ref --format='%(upstream:short)' refs/heads/${GIT_BRANCH})

  if [[ -n "$upstream" ]] && [[ -n $(git branch --all --list ${upstream} 2>/dev/null) ]]; then
    ahead=$(git rev-list ${upstream}..${branch} | wc -l | tr -d ' ')
    behind=$(git rev-list ${branch}..${upstream} | wc -l | tr -d ' ')

    if [ "$ahead" -gt 0 ]; then
      GIT_TRACK+=" ↑${ahead}"
    fi

    if [ "$behind" -gt 0 ]; then
      GIT_TRACK+=" ↓${behind}"
    fi
  fi

  echo -e "${GIT_PROMPT_PREFIX}${GIT_BRANCH}${GIT_TRACK}${GIT_STATE}${GIT_PROMPT_SUFFIX}"
}
