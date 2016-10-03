#!/usr/bin/env bash
#
# Bootstrap macOS
set -e

# Make sure we're in the bootstrap root
BOOTSTRAP_ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "${BOOTSTRAP_ROOT}"

# Source additional functions
source ../lib/functions

# Check we're on macOS
OS="$(uname -s | awk '{print tolower($0)}')"

if [ "${OS}" != "darwin" ]; then
  abort "This can only be run on Mac systems."
fi

MACOS_VERSION="$(/usr/bin/sw_vers -productVersion)"
printf -v MACOS_VERSION_NUMERIC "%02d%02d%02d" ${MACOS_VERSION//./ }

# This may work on older systems, but this is the oldest one I use
if [ "${MACOS_VERSION_NUMERIC}" -lt "100900" ]; then
  abort "Your system is too old. You need Mavericks (10.9) or newer."
fi

# Make sure Boxen doesn't exist
if [ -d /opt/boxen ]; then
  abort "It looks like you are using Boxen. I don't play well with Boxen."
fi

# Sudo may cause unwanted results
if [ "${USER}" == "root" ]; then
  abort "Run this as a normal user, I'll sudo if I need to."
fi

## START: functions ##
install_package() {
  local package="$1"

  # TODO: --upgrade flag
  if ! $(brew list "${package}" &>/dev/null); then
    info "Installing ${package}"
    brew install "${package}" &>/dev/null
  fi
}

install_unlinked_package() {
  local package="$1"

  # TODO: --upgrade flag
  if ! $(brew list "${package}" &>/dev/null); then
    info "Installing and unlinking ${package}"
    brew install "${package}" &>/dev/null
    brew unlink "${package}" &>/dev/null
  fi
}

install_app() {
  local app="$1"

  if ! $(brew cask list "${app}" &>/dev/null); then
    info "Installing ${app}"
    brew cask install "${app}" &>/dev/null
  fi
}

install_font() {
  local font="$1"

  install_app "font-${font}"
}

brew_tap() {
  local tap="$1"

  (brew tap | grep "${tap}") &>/dev/null || brew tap "${tap}" &>/dev/null
}

ruby_install() {
  local version="$1"

  (rbenv versions | grep "${version}") &>/dev/null || (info "Installing Ruby ${version}" && rbenv install "${version}" &>/dev/null)
}

python_install() {
  local version="$1"

  (pyenv versions | grep "${version}") &>/dev/null || (info "Installing Python ${version}" && pyenv install "${version}" &>/dev/null)
}
## END: functions ##

# Make sure /usr/local is in our PATH
PATH="/usr/local/bin:$PATH"

# Install Command Line Tools
info "Installing Command Line Tools"
xcode-select -p &>/dev/null || xcode-select --install

# Install Homebrew
info "Installing Homebrew"
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# TODO: brew doctor

# brew packages (see: `http://braumeister.org/`)
install_package "git"
install_package "git-flow"
install_package "wget"
install_package "ack"
install_package "tmux"
install_package "reattach-to-user-namespace"

# Brew cask (see: `https://caskroom.github.io/search`)
brew_tap "caskroom/cask"
install_app "dropbox"
install_app "iterm2"
install_app "sequel-pro"
install_app "tower"
install_app "google-chrome"
install_app "caffeine"
install_app "spotify"
install_app "spotify-notifications"
install_app "virtualbox"
install_app "vagrant"
install_app "vagrant-manager"
install_app "phpstorm"
install_app "atom"
install_app "hipchat"
install_app "macdown"

if [ "${HOSTNAME}" == "Matts-Air" ]; then
  install_app "flux"
  install_app "ableton-live"
  install_app "ilok-license-manager"
fi

# Udpated Bash
info "Updating bash"
install_package "bash"
install_package "bash-completion"

(cat /etc/shells | grep /usr/local/bin/bash) &>/dev/null || (echo "/usr/local/bin/bash" | sudo tee -a /etc/shells)

if [ "${SHELL}" != "/usr/local/bin/bash" ]; then
  chsh -s /usr/local/bin/bash
fi

header "Bash Completion"
cat << 'EOF'
To enable bash completion add the following lines to your ~/.bash_profile:
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

EOF

info "Installing Docker"
if [ "${MACOS_VERSION_NUMERIC}" -ge "101003" ]; then
  install_app "docker"
  install_app "kitematic"
else
  install_app "docker-toolbox"
fi

# NodeJS via n (see: `https://github.com/tj/n`)
info "Installing NodeJS via N"
install_package "n"

n stable

# Ruby via rbenv (see: `https://github.com/rbenv/rbenv`)
info "Installing Ruby via rbenv"
install_package "rbenv"
install_package "rbenv-default-gems"

if ! $(type rbenv | grep 'rbenv is a function'); then
  eval "$(rbenv init -)"
fi

default_gems_file=$(rbenv root)/default-gems

(cat "${default_gems_file}" | grep bundler) &>/dev/null | (echo 'bundler' >> "${default_gems_file}")

# rbenv install 1.9.3-p545
# rbenv install 2.0.0-p648
# rbenv install 2.1.10
# rbenv install 2.2.5
ruby_install 2.3.1

rbenv global 2.3.1

header "Ruby (rbenv)"
cat << 'EOF'
To enable Ruby management add the following line to your ~/.bash_profile:
  eval "$(rbenv init -)"

EOF

# Python via pyenv (see: `https://github.com/yyuu/pyenv`)
info "Installing Python via pyenv"
install_package "pyenv"
install_package "pyenv-ccache"
install_package "pyenv-virtualenvwrapper"

if ! $(type pyenv | grep 'pyenv is a function'); then
  eval "$(pyenv init -)"
fi

python_install 2.7.12

if [ "${HOSTNAME}" != "Matts-Air" ]; then
  python_install 3.5.2
fi

pyenv global 2.7.12

header "Python (pyenv)"
cat << 'EOF'
To enable Python management add the following line to your ~/.bash_profile:
  eval "$(pyenv init -)"

EOF

# PHP with switch script
info "Installing PHP"
brew_tap "homebrew/dupes"
brew_tap "homebrew/versions"
brew_tap "homebrew/homebrew-php"

if [ "${HOSTNAME}" != "Matts-Air" ]; then
  install_unlinked_package "php54"
  install_unlinked_package "php55"
fi

install_unlinked_package "php56"
install_unlinked_package "php70"

# PHP Manage Command
src="${BOOTSTRAP_ROOT}/files/mphp"
dest="/usr/local/bin/mphp"

if [ ! -f "${dest}" ] || [ "${src}" -nt "${dest}" ]; then
  cp "${src}" "${dest}"
  chmod +x "${dest}"
fi

header "PHP"
cat << 'EOF'
To manage PHP versions, use the `mphp` script:
  /usr/local/bin/mphp switch 56

EOF

# Composer
install_package "composer"

# Fonts via Cask (see: `https://github.com/caskroom/homebrew-fonts`)
info "Installing fonts"
brew_tap caskroom/fonts
install_font "source-code-pro"
install_font "source-sans-pro"
install_font "lato"
install_font "monoid"
install_font "fontawesome"

success "Bootstraped!"
warn "You may need to restart your shell and/or computer to take affect."
