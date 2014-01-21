#!/usr/bin/env bash
# Install pip and virtualenv/virutalenvwrapper locally when on systems
# without root access

# Get the Python version we're installing from
PYTHON_VERSION_SHORT=$( python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

LOCAL_SCRIPTS_PATH=".usr/bin"
LOCAL_DATA_PATH=".usr/share"
LOCAL_LIB_PATH=".usr/lib/python$PYTHON_VERSION_SHORT/site-packages"

# This file will tell easy_install to install locally
cat <<EOF >.pydistutils.cfg
[install]
install_scripts = ~/$LOCAL_SCRIPTS_PATH
install_data = ~/$LOCAL_DATA_PATH
install_lib = ~/$LOCAL_LIB_PATH
EOF

mkdir -p $LOCAL_SCRIPTS_PATH
mkdir -p $LOCAL_DATA_PATH
mkdir -p $LOCAL_LIB_PATH
mkdir ~/.envs

cat <<EOF >>.bashrc
export PYTHONPATH=\$HOME/$LOCAL_LIB_PATH:\$PYTHONPATH
export WORKON_HOME=\$HOME/.envs
export PATH=\$HOME/$LOCAL_SCRIPTS_PATH:\$PATH
EOF

source .bashrc

easy_install pip
pip install --user virtualenvwrapper

cat <<EOF >>.bashrc
source \$HOME/$LOCAL_SCRIPTS_PATH/virtualenvwrapper.sh
EOF

source $HOME/$LOCAL_SCRIPTS_PATH/virtualenvwrapper.sh

# .pydistutils will not let virtualenv install pip
rm .pydistutils.cfg
