cask_args appdir: "/Applications"

tap "homebrew/cask-fonts"
tap "thoughtbot/formulae"

brew "ack"
brew "bash"
brew "coreutils"
brew "git"
brew "git-flow"
brew "git-lfs"
brew "git-standup"
brew "m-cli"
brew "n"
# brew "packer"
brew "reattach-to-user-namespace"
brew "readline"
brew "rbenv"
brew "rbenv-default-gems"
brew "rcm"
# brew "thefuck"
# brew "tmux"
brew "wget"

# Completions
brew "bash-completion"
brew "docker-completion"
brew "docker-compose-completion"
brew "open-completion"
# brew "packer-completion"
brew "pip-completion"
brew "vagrant-completion"

cask "atom"
cask "beardedspice"
cask "caffeine"
cask "docker"
cask "dropbox"
cask "font-source-code-pro"
cask "font-source-sans-pro"
cask "font-lato"
cask "font-monoid"
cask "google-chrome"
cask "hyper"
cask "jetbrains-toolbox"
cask "kaleidoscope"
cask "kitematic"
cask "macdown"
cask "rocket"
cask "sequel-pro"
cask "tower"
cask "vagrant"
cask "virtualbox"

mas "1Password", id: 443987910

case `hostname`.strip
when 'Apollo' # Personal laptop
  cask "ableton-live-suite"
  cask "ilok-license-manager"
when 'Artemis' # Work laptop
  cask "hipchat"
  cask "slack"
end
