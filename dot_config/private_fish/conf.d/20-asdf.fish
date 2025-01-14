set -gx ASDF_NPM_DEFAULT_PACKAGES_FILE ~/.config/asdf/default-npm-packages
set -gx ASDF_GEM_DEFAULT_PACKAGES_FILE ~/.config/asdf/default-gems
set -gx ASDF_PYTHON_DEFAULT_PACKAGES_FILE ~/.config/asdf/default-python-packages

source $(brew --prefix asdf)/libexec/asdf.fish
