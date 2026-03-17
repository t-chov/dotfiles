# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for a zsh + sheldon + vim development environment. The setup script symlinks config files into `$HOME`.

## Installation

Run `setup.zsh` to bootstrap the environment. It:

1. Creates `~/.vim/plugins/` and symlinks `rc/`, `syntax/`, `dict/`, and `vimrc` into `~/.vim/`
2. Links `sheldon/plugins.toml` into `~/.config/sheldon/`
3. Symlinks `zprofile` to `~/.zprofile` and `zshrc` to `~/.zshrc`
4. Symlinks `tmux.conf` to `~/.tmux.conf`

After running:

```sh
sheldon lock   # download all plugins
```

## Requirements

- zsh, sheldon, ghq, peco, starship, pyenv

## File Structure

| File/Dir | Purpose |
|---|---|
| `setup.zsh` | Bootstrap script — symlinks all configs |
| `zprofile` | Login shell — env vars (BROWSER, EDITOR, PAGER, LANG, LESS), PATH, pyenv init |
| `zshrc` | Interactive shell — zsh options, sheldon plugin loading, peco-src keybind (`Ctrl+]`), compinit |
| `sheldon/plugins.toml` | Sheldon plugin manifest — zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting |
| `vimrc` | Vim config using dein.vim plugin manager |
| `tmux.conf` | tmux config — prefix is `C-q`, vim-style pane navigation |
| `rc/dein.toml` | Always-loaded vim plugins |
| `rc/dein_lazy.toml` | Filetype-lazy vim plugins (JS, Go, PHP, Vue, etc.) |
| `syntax/php.vim` | PHP syntax file |
| `dict/php.dict` | PHP dictionary for neocomplete |

## Key Configurations

**zprofile/zshrc split**: Login-shell env vars live in `zprofile`; interactive config (options, plugins, keybinds) lives in `zshrc`.

**zshrc**: `Ctrl+]` triggers `peco-src` — fuzzy-finds ghq-managed repos and `cd`s into them. Sheldon loads plugins (completions, autosuggestions, syntax-highlighting), then `compinit` runs. Starship prompt is initialized via `eval "$(starship init zsh)"` at the end.

**vimrc**: Uses dein.vim (plugins in `~/.vim/plugins/`). Key plugins: neocomplete, neosnippet, NERDTree (`nt`), unite.vim, ALE (lint on save only), vim-fugitive, neoformat (auto-formats JS on save).

**tmux.conf**: Prefix `C-q`, vim-style pane selection (`h/j/k/l`), split with `v`/`s`, mouse enabled.
