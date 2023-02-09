cask_args appdir: "/Applications"

tap "1password/tap"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "thoughtbot/formulae"

brew "ack"
brew "antidote"
brew "asdf"
brew "aspell"
brew "bat"
brew "broot"
brew "coreutils"
brew "dust"
brew "exa"
brew "fd"
brew "fzf"
brew "gh"
brew "git"
brew "git-lfs"
brew "golangci-lint"
brew "gron"
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

# Fonts
cask "font-fira-code-nerd-font"

localbrew = "#{Dir.home}/.Brewfile.local"
instance_eval(File.read(localbrew)) if File.exists?(localbrew)
