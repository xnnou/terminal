#!/bin/bash
# This script for MacOS
#
pip3 install powerline-shell
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
sudo python setup.py install

# BASH
echo 'function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' > ~/.bashrc

# ZSH
echo 'function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi' > .zshrc

# FISH
echo 'function fish_prompt
    powerline-shell --shell bare $status
end' > ~/.config/fish/config.fish
