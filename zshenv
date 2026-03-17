#
# Executes commands at shell initialization (login, interactive, and non-interactive).
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  /usr/local/go/bin
  $HOME/go/bin
  $HOME/.local/bin
  $HOME/.local/share/fnm
  $path
)
