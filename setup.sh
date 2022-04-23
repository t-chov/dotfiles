#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
echo "script dir: ${script_dir}"

if [ ! -d "${HOME}/.vim/plugins" ]
then
  mkdir -p ${HOME}/.vim/plugins
fi

ln -s ${script_dir}/rc     ${HOME}/.vim
ln -s ${script_dir}/syntax ${HOME}/.vim
ln -s ${script_dir}/dict   ${HOME}/.vim
ln -s ${script_dir}/vimrc  ${HOME}/.vimrc

ls -l ${HOME}/.vimrc
ls -l ${HOME}/.vim
