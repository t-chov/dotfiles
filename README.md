# dotfiles

Files for my developing environment.

## requirements

- zsh
- sheldon
- ghq
- peco
- starship

## usage

1. exec `./setup.zsh`
2. `sheldon lock` (downloads all plugins)

-----

## Installation

- [windows](https://qiita.com/mtsgi/items/8a844870f30b30ef21e4)

## install zsh

```sh
# windows
sudo apt install zsh
zsh
# press q
./setup.zsh
```

## install powerline fonts

- [windows](https://qiita.com/mtsgi/items/8a844870f30b30ef21e4#powerline-on-zsh-on-ubuntu-on-wsl2-on-windows-10)

## install Go

Download the tarball from <https://go.dev/dl/> and extract to `/usr/local`:

```sh
sudo tar -C /usr/local -xzf go<version>.linux-amd64.tar.gz
```

`/usr/local/go/bin` is already added to `PATH` via `zprofile`.
