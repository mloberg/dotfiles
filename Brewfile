cask_args appdir: "/Applications"

tap "homebrew/bundle"
tap "homebrew/cask-fonts"

brew "ack"
brew "antidote"
brew "asdf"
brew "aspell"
brew "bat"
brew "broot"
brew "coreutils"
brew "direnv"
brew "dust"
brew "eza"
brew "fd"
brew "fzf"
brew "gh"
brew "git"
brew "git-delta"
brew "git-lfs"
brew "go"
brew "go-task"
brew "golangci-lint"
brew "gron"
brew "gum"
brew "hadolint"
brew "httpie"
brew "jq"
brew "lesspipe"
brew "m-cli"
brew "mas"
brew "mkcert"
brew "nss"
brew "reattach-to-user-namespace"
brew "readline"
brew "rcm"
brew "sd"
brew "shellcheck"
brew "starship"
brew "tflint"
brew "the_silver_searcher"
brew "tldr"
brew "vim"
brew "wget"
brew "yq"
brew "zsh-completions"

cask "1password"
cask "1password-cli"
cask "docker"
cask "firefox"
cask "gpg-suite-no-mail"
cask "notion"
cask "visual-studio-code"
cask "yubico-authenticator"

# Fonts
cask "font-fira-code-nerd-font"

localbrew = "#{Dir.home}/.Brewfile.local"
instance_eval(File.read(localbrew)) if File.exists?(localbrew)
