# dotfiles

Files for my developing environment.

* .vimrc

-----

# Installation

- [windows](https://qiita.com/mtsgi/items/8a844870f30b30ef21e4)

## install zsh

```sh
# windows
sudo apt install zsh
```

## install [prezto](https://github.com/sorin-ionescu/prezto)

```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
zsh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

## install powerline fonts

- [windows](https://qiita.com/mtsgi/items/8a844870f30b30ef21e4#powerline-on-zsh-on-ubuntu-on-wsl2-on-windows-10)

## use agnoster

```sh
cat << EOF
autoload -Uz promptinit
promptinit
prompt agnoster
EOF >> ~/.zshrc
```