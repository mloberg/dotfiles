#!/usr/bin/env bash

function prompt_command() {
	printf "${red}%s: ${bold_green}%s ${purple}|ruby %s|python %s| ${white}%s\n${text_reset}" "$USER" "$PWD" "$(ruby_version_prompt)" "$(python_version_prompt)" "$(vcprompt -f '[%s:%b:%h]%a%m%u')"
}

PROMPT_COMMAND=prompt_command;
PS1="-> "
