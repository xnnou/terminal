export ZSH=$HOME/.oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="amuse"
ZSH_THEME="bira"
#ZSH_THEME="bureau"
#ZSH_THEME=""

plugins=( git 
	zsh-autosuggestions )
source $ZSH/oh-my-zsh.sh

# User configuration

bindkey '^ ' autosuggest-accept
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line
