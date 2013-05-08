#!/usr/bin/env bash

THEME_PROMPT_HOST='\H'

VIRTUALENV_THEME_PROMPT_PREFIX=' |'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'

function ruby_version_prompt {
  echo -e "$(ruby -e "puts RUBY_VERSION")"
}

function python_version_prompt {
	echo -e $(python -c "import sys;print('%s.%s.%s' % sys.version_info[:3])")
}

function virtualenv_prompt {
  if which virtualenv &> /dev/null; then
    virtualenv=$([ ! -z "$VIRTUAL_ENV" ] && echo "`basename $VIRTUAL_ENV`") || return
    echo -e "$VIRTUALENV_THEME_PROMPT_PREFIX$virtualenv$VIRTUALENV_THEME_PROMPT_SUFFIX"
  fi
}
