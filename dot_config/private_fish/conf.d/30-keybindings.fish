# Clear line on CTRL + C
bind \cc 'commandline -r ""'

# Run ls on CTRL + l
bind \cl 'ls; commandline -f repaint'

# Navigate directory history with CTRL + arrow
bind \cA 'prevd; commandline -f repaint'
bind \cE 'nextd; commandline -f repaint'
