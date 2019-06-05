pathmunge ./node_modules/.bin

# Make sure the global npm prefix is on the path
command -v npm >/dev/null && pathmunge "$(npm config get prefix)/bin"
