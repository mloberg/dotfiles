cask_args appdir: "/Applications"

tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "thoughtbot/formulae"
tap "getantibody/tap"

brew "ack"
brew "antibody"
brew "aspell"
brew "coreutils"
brew "dtrx"
brew "fzf"
brew "git"
brew "git-lfs"
brew "git-standup"
brew "go"
brew "gron"
brew "httpie"
brew "jq"
brew "lesspipe"
brew "m-cli"
brew "mkcert"
brew "n"
brew "nss"
brew "packer"
brew "pinentry-mac"
brew "pyenv"
brew "reattach-to-user-namespace"
brew "readline"
brew "rbenv"
brew "rbenv-default-gems"
brew "rcm"
brew "shellcheck"
brew "skaffold"
# brew "spoof-mac"
brew "starship"
brew "terraform"
brew "tflint"
# brew "thefuck"
brew "the_silver_searcher"
brew "tldr"
brew "vim"
brew "wget"
brew "zsh"
brew "zsh-completions"

cask "1password"
cask "aerial"
cask "brave-browser"
cask "caffeine"
cask "dash"
cask "docker"
cask "firefox"
cask "gpg-suite"
cask "hyper"
cask "insomnia"
cask "keybase"
# cask "lunchy"
# cask "sequel-pro"
cask "stoplight-studio"
cask "tableplus"
cask "visual-studio-code"

# Quicklook plugins
cask "qlmarkdown"
cask "quicklook-json"

# Security apps
cask "knockknock"
cask "oversight"
cask "do-not-disturb"

# Mac Apps
mas "Irvue", id: 1039633667

localbrew = "#{Dir.home}/.Brewfile.local"
instance_eval(File.read(localbrew)) if File.exists?(localbrew)
