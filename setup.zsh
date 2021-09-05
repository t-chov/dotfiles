#!/usr/bin/env zsh

script_dir=$(cd $(dirname $0); pwd)
echo "script dir: ${script_dir}"

if [ ! -d "${HOME}/.vim/plugins" ]
then
  mkdir -p ${HOME}/.vim/plugins
  ln -s ${script_dir}/rc     ${HOME}/.vim
  ln -s ${script_dir}/syntax ${HOME}/.vim
  ln -s ${script_dir}/dict   ${HOME}/.vim
  ln -s ${script_dir}/vimrc  ${HOME}/.vimrc
fi

if [ ! -d "${HOME}/.zprezto" ]
then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

ln -s ${script_dir}/tmux.conf ${HOME}/.tmux.conf