# Date: 11-Aug-2020
# Update: 25-Nov-2020
# Powerline for bash vim tmux fish
#
# https://github.com/b-ryan/powerline-shell
# https://github.com/powerline/powerline
# https://devpro.media/install-powerline-ubuntu/#
# https://powerline.readthedocs.io/en/master/usage/shell-prompts.html
#
#
sudo apt install vim tmux fish htop net-tools -y
sudo apt install python 
git clone https://github.com/powerline/powerline.git
cd powerline 
sudo python3 setup.py install
#
git clone https://github.com/powerline/fonts.git
cd fonts
sudo /install.sh
#
echo "================== BASH ====================================="
echo 'function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' > ~.bashrc
#
echo "================== FISH ====================================="
echo 'fish
function fish_prompt
    powerline-shell --shell bare $status
end ' > ~/.config/fish/config.fish
#
echo "================== VIM ======================================"
echo 'python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2' > ~/.vimrc
#
echo "================== TMUX ====================================="
echo 'set -g default-terminal "screen-256color"
source "/usr/share/powerline/bindings/tmux/powerline.conf"' > ~/.tmux.conf
