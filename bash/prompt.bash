#!/usr/bin/env bash

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

function battery_status() {
    $DOT/bin/battery-status
}

SCM_THEME_PROMPT_PREFIX="${white} ["
SCM_THEME_PROMPT_SUFFIX="${white}]"
SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"

function prompt() {
  PS1="\[\033]0;\u@\h:\w\007\]" # Set title
  PS1+="$(battery_status)"
  PS1+="${red}\u@\h:" # user@host
  PS1+="${bold_green}\w" # pwd
  PS1+="${purple} |$(ruby_version_prompt)$(python_version_prompt)$(node_version_prompt)$(php_version_prompt)"
  PS1+="${white}$(scm_prompt_info)"
  PS1+="\n"
  PS1+="${cyan}$(virtual_env_prompt)"
  PS1+="${reset_color}-> "
  PS2=" > "
}

safe_append_prompt_command prompt
