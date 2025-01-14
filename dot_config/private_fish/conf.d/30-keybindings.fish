# Clear line on CTRL + C
bind \cc 'commandline -r ""'

# Run ls on CTRL + l
bind \cl 'ls; commandline -f repaint'

# Git bindings
bind \cS 'git status; echo; commandline -f repaint'
bind \cG 'git diff; echo; commandline -f repaint'
