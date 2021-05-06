cask_args appdir: "/Applications"

tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "thoughtbot/formulae"
tap "getantibody/tap"

brew "ack"
brew "antibody"
brew "asdf"
brew "aspell"
brew "coreutils"
brew "fd"
brew "fzf"
brew "gh"
brew "git"
brew "git-lfs"
brew "gron"
brew "httpie"
brew "jq"
brew "lesspipe"
brew "m-cli"
brew "mkcert"
brew "nss"
brew "reattach-to-user-namespace"
brew "readline"
brew "rcm"
brew "shellcheck"
brew "starship"
brew "tflint"
brew "the_silver_searcher"
brew "tldr"
brew "vim"
brew "wget"

cask "1password"
cask "docker"
cask "firefox"
cask "gpg-suite-no-mail"
cask "notion"
cask "visual-studio-code"

# Fonts
cask "font-fira-code-nerd-font"

localbrew = "#{Dir.home}/.Brewfile.local"
instance_eval(File.read(localbrew)) if File.exists?(localbrew)
