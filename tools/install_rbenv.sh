#!/usr/bin/env bash
# Install rbenv

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
cat <<EOF >>~/.bashrc
export PATH="\$HOME/.rbenv/bin:\$PATH"
eval "\$(rbenv init -)"
EOF

# Install ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Restart the shell
source ~/.bashrc
