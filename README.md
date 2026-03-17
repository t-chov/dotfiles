# dotfiles

Files for my developing environment.

## requirements

- zsh
- sheldon
- ghq
- peco
- starship
- fnm
- uv

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

## change default shell (Linux)

```sh
chsh -s $(which zsh)
```

ログアウト後に再ログインすると反映される。

## install powerline fonts

- [windows](https://qiita.com/mtsgi/items/8a844870f30b30ef21e4#powerline-on-zsh-on-ubuntu-on-wsl2-on-windows-10)

## install sheldon

```sh
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/tool.sh \
  | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
```

## install ghq

```sh
go install github.com/x-motemen/ghq@latest
```

## install peco

```sh
go install github.com/peco/peco/cmd/peco@latest
```

## install starship

```sh
curl -sS https://starship.rs/install.sh | sh
```

## install fnm

```sh
curl -fsSL https://fnm.vercel.app/install | bash
```

インストール後、`fnm install <version>` で Node.js をインストールする。

## install Go

Download the tarball from <https://go.dev/dl/> and extract to `/usr/local`:

```sh
sudo tar -C /usr/local -xzf go<version>.linux-amd64.tar.gz
```

`/usr/local/go/bin` is already added to `PATH` via `zprofile`.

## install uv

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

インストール後、`uv python install <version>` で Python をインストールする。

## machine-local / secret env vars

`~/.zprofile.local` と `~/.zshrc.local` にマシン固有の設定やシークレットを書く。
これらのファイルは `setup.zsh` 実行時に自動で作成され、git には含まれない。

| ファイル | 用途 |
| --- | --- |
| `~/.zprofile.local` | ログインシェル用（API キー、PATH 追加など） |
| `~/.zshrc.local` | インタラクティブシェル用（エイリアス、関数など） |

```zsh
# ~/.zprofile.local の例
export GITHUB_TOKEN="ghp_xxxx"
export AWS_ACCESS_KEY_ID="AKIA..."
export AWS_SECRET_ACCESS_KEY="..."
```
