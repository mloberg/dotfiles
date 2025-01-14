set -gx GPG_TTY "$(tty)"
set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"

gpgconf --launch gpg-agent

abbr -a gpgkill gpgconf --kill gpg-agent
abbr -a yubi-switch 'gpg-connect-agent "scd serialno" "learn --force" /bye'
