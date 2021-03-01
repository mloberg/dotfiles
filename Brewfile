cask_args appdir: "/Applications"

tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "thoughtbot/formulae"
tap "getantibody/tap"

brew "ack"
brew "antibody"
brew "aspell"
brew "coreutils"
brew "fd"
brew "fzf"
brew "git"
brew "git-lfs"
brew "go"
brew "gpg"
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
brew "starship"
brew "terraform"
brew "tflint"
brew "the_silver_searcher"
brew "tldr"
brew "vim"
brew "wget"
brew "zsh"
brew "zsh-completions"

cask "1password"
cask "brave-browser"
cask "dash"
cask "docker"
cask "firefox"
cask "notion"
cask "tableplus"
cask "visual-studio-code"

# Fonts
cask "font-fira-code-nerd-font"

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
