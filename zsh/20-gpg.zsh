export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

alias gpg=gpg2

conceal() {
    gpg --encrypt --armor -r 0x2355A228A9F1D6CF --output "$1.enc" "$1"
}

reveal() {
    gpg --decrypt --output "${1%.enc}" "$1"
}
