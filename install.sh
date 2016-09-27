#!/usr/bin/env bash
#
# Run all dotfiles installers.
set -e

# Make sure we're in the dotfiles root
DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "${DOTFILES_ROOT}"

# Source additional functions
source ./lib/functions

# Global settings
overwrite_all=false
backup_all=false
skip_all=false

## START: functions ##
link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]; then
        skip=true;
      else
        user "File already exists: $(basename "$dst"), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]; then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]; then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]; then  # "false" or empty
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

## bash it install functions ##

# enable a thing
function load_one() {
  file_type=$1
  file_to_enable=$2
  mkdir -p "$BASH_IT/${file_type}/enabled"

  dest="${BASH_IT}/${file_type}/enabled/${file_to_enable}"
  if [ ! -e "${dest}" ]; then
    ln -sf "../available/${file_to_enable}" "${dest}"
  else
    echo "File ${dest} exists, skipping"
  fi
}

# Interactively enable several things
function load_some() {
  file_type=$1
  [ -d "$BASH_IT/$file_type/enabled" ] || mkdir "$BASH_IT/$file_type/enabled"
  for path in `ls $BASH_IT/${file_type}/available/[^_]*`
  do
    file_name=$(basename "$path")
    while true
    do
      read -e -n 1 -p "Would you like to enable the ${file_name%%.*} $file_type? [y/N] " RESP
      case $RESP in
      [yY])
        ln -s "../available/${file_name}" "$BASH_IT/$file_type/enabled"
        break
        ;;
      [nN]|"")
        break
        ;;
      *)
        echo -e "\033[91mPlease choose y or n.\033[m"
        ;;
      esac
    done
  done
}

## END: functions ##

if [ "${USER}" == "root" ]; then
  abort "Run this as a normal user, I'll sudo if I need to."
fi

OS="$(uname -s | awk '{print tolower($0)}')"

# Make sure submodules are initialized and updated
git submodule init
git submodule update

# Symlink dotfiles
info "Symlinking dotfiles"

# Symlink dotfiles that don't begin with "_"
for file in dotfiles/*; do
  dotfile=$(basename "${file}")

  if [ "${dotfile:0:1}" != "_" ]; then
    link_file "${DOTFILES_ROOT}/${file}" "${HOME}/.${dotfile}"
  fi
done

# Symlink OS specific dotfiles
if [ -d "dotfiles/_${OS}" ]; then
  for file in "dotfiles/_${OS}"/*; do
    dotfile=$(basename "${file}")

    if [ "${dotfile:0:1}" != "_" ]; then
      link_file "${DOTFILES_ROOT}/${file}" "${HOME}/.${dotfile}"
    fi
  done
fi

success "Symlinked dotfiles"

# Create gitconfig file if one doesn't exist
template="templates/gitconfig.template"
dest="${HOME}/.gitconfig"

if [ ! -f "${dest}" ] || [ "${template}" -nt "${dest}" ]; then
  info 'Generating ~/.gitconfig'

  git_credential='cache'

  if [ "${OS}" == "darwin" ]; then
    git_credential='osxkeychain'
  fi

  user 'What is your Git author name?'
  read -e git_authorname
  user 'What is your Git author email?'
  read -e git_authoremail

  (sed "s|{{AUTHORNAME}}|${git_authorname}|;s|{{AUTHOREMAIL}}|${git_authoremail}|;s|{{GIT_CREDENTIAL_HELPER}}|${git_credential}|" "${template}") > "${dest}"

  success 'Generated ~/.gitconfig'
fi

# Install bash it (https://github.com/Bash-it/bash-it)
BASH_IT="$HOME/.bash_it"

# Clone the repo
if [ ! -d "$BASH_IT" ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git "$BASH_IT"
fi

for type in "aliases" "plugins" "completion"; do
  # Run only if not ran before
  if [ ! "$(ls -A $BASH_IT/$type/enabled 2>/dev/null)" ] || [ "$1" = "--update" ]; then
    echo -e "\033[0;32mEnabling $type\033[0m"
    load_some $type
  fi
done

# Install Vundle
vim -u "${DOTFILES_ROOT}/lib/vimrc" +PluginInstall +qall

success "Dotfiles installed. Please reload your shell to take affect."
