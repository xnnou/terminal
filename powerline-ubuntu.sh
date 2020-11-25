# Date: 11-Aug-2020
# Update: 25-Nov-2020
# X-Powerline for bash vim tmux fish
# https://devpro.media/install-powerline-ubuntu/#
# https://powerline.readthedocs.io/en/master/usage/shell-prompts.html
# We only tested on Ubuntu 20.04
sudo apt install tmux fish htop net-tools -y
sudo apt install python3 python3-pip

pip3 install powerline-shell
# https://github.com/b-ryan/powerline-shell.git
# git clone https://github.com/b-ryan/powerline-shell.git
cd powerline-shell
python setup.py install

echo'
function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' > ~.bashrc

echo 'fish
function fish_prompt
    powerline-shell --shell bare $status
end ' > ~/.config/fish/config.fish

#--- VIM ---#
echo '--- VIM ---'
sudo apt update -y
sudo apt install -y vim

echo 'python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2' > ~/.vimrc

#--- tmux ---#
echo '--- tmux ---'
echo 'set -g default-terminal "screen-256color"
source "/usr/share/powerline/bindings/tmux/powerline.conf"' > ~/.tmux.conf
