from lib.six.moves import input

template = """
# Bash it theme
export BASH_IT_THEME="i_hate_everyone"

# Your place for hosting Git repos. Used in bash it's git plugin
export GIT_HOSTING="{{ git_hosting }}"

# Set my editor and git editor
export EDITOR="{{ editor }}"
export GIT_EDITOR="{{ git_editor }}"

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT="{{ irc_client }}"

# Load custom scripts
for f in ~/.bash.d/*; do source $f; done

# Load bash it
[ -f "$HOME/.bash_it/init.sh" ] && source $HOME/.bash_it/init.sh
"""

def input_or_default(prompt, default):
    def ask_prompt():
        response = input(prompt).strip()
        if response == '':
            response = default
        return response
    return ask_prompt

variables = {
    'git_hosting': lambda: input_prompt("Git host: "),
    'editor': input_or_default("Editor (default vim): ", "/usr/bin/vim"),
    'git_editor': input_or_default("Git commit editor (default vim): ",
                                   "/usr/bin/vim"),
    'irc_client': input_or_default("IRC client: ", "irc"),
}
