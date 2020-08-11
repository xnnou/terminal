# Date: 11-Aug-2020
# X-Powerline for bash vim tmux fish
# https://devpro.media/install-powerline-ubuntu/#
# https://powerline.readthedocs.io/en/master/usage/shell-prompts.html
# We only tested on Ubuntu 20.04

#--- Powerline ---#
echo '--- Powerline ---'
sudo add-apt-repository universe
sudo apt install -y powerline

#--- Bash ---#
echo '--- Bash ---'
echo '# powerline 07-Aug-2020
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi' > ~./.bashrc

source ~/.bashrc


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

#--- fish ---#
echo '--- fish ---'
echo 'set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
source /usr/share/powerline/bindings/fish/powerline-setup.fish
powerline-setup' > ~/.config/fish/config.fish
