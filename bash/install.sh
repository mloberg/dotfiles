#!/usr/bin/env bash
#
# Install bash-it (https://github.com/Bash-it/bash-it)

# Install path
BASH_IT="$HOME/.bash_it"

# Clone the repo
if [ ! -d "$BASH_IT" ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git "$BASH_IT"
fi

## START: Functions from the bash-it install script ##

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

## END: bash-it install functions ##

for type in "aliases" "plugins" "completion"; do
  # Run only if not ran before
  if [ ! "$(ls -A $BASH_IT/$type/enabled 2>/dev/null)" ] || [ "$1" = "--update" ]; then
    echo -e "\033[0;32mEnabling $type\033[0m"
    load_some $type
  fi
done
