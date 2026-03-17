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

# sheldon config
mkdir -p "${HOME}/.config/sheldon"
[ ! -f "${HOME}/.config/sheldon/plugins.toml" ] && \
  ln -s "${script_dir}/sheldon/plugins.toml" "${HOME}/.config/sheldon/plugins.toml"

# zsh config
[ ! -f "${HOME}/.zprofile" ] && ln -s "${script_dir}/zprofile" "${HOME}/.zprofile"
[ ! -f "${HOME}/.zshrc" ]    && ln -s "${script_dir}/zshrc"    "${HOME}/.zshrc"

[ ! -f "${HOME}/.tmux.conf" ] && ln -s "${script_dir}/tmux.conf" "${HOME}/.tmux.conf"