#
# Interactive shell configuration
#

# zsh options
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Load plugins via sheldon (includes powerlevel10k, zsh-completions,
# zsh-autosuggestions, zsh-syntax-highlighting)
eval "$(sheldon source)"

# Enable completion (after sheldon so zsh-completions fpath additions are picked up)
autoload -U compinit; compinit

zstyle ':completion:*:default' menu select=1

# Ctrl+] to fuzzy-find ghq repos and cd into them
bindkey '^]' peco-src
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
