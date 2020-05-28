#!/bin/bash

# Make vim easier on Sean's eyes
# Sean Wingert August 25, 2017

# read-menu: a menu driven system information program

# read-validate: validate input
get_input () {
while :
 do 
		clear
		cat <<- EOF
				Sean's myvim
				------
			Please Select:

			  1. Install plugins (vim-colors-solarized, vim-json, vim-log-syntax)
			  2. Uninstall plugins 
			  3. List installed bundles
			  4. Edit .vimrc
			  5. Enable putty-colors-solarized
			  6. Disable putty-colors-solarized
			  7. Quit
			
				Colors still not working? Either:
				  1. Download putty-colors-solarized (double-click a dark or light .reg and reload Putty)
				  2. Putty > Settings > Connection > Data > Terminal-type string: xterm-256color

		EOF
		read -n1 -p "Enter selection [1-6] : "

		case "$REPLY" in
			"1") do_install ;;
			"2") do_uninstall ;;
			"3") echo ; echo ; ls -lha ~/.vim/bundle ; echo ; read -p "End of listing" ;;
			"4") [[ -s ~/.vimrc ]] && vim ~/.vimrc || printf "\n\n" && printf " NOTE: ~/.vimrc does not exist or is empty." && sleep 1.5 ;;
			"5") palette="true" && do_uninstall && do_install ;;
			"6") unset palette && do_uninstall && do_install ;;
			"7") echo ; echo ; exit ;;
			"q") echo ; echo ; exit ;;

		esac
  done
}

do_uninstall() {
  #set -x
	printf "\n\n"
	echo "Remove pathogen"
	rm -fv ~/.vim/autoload/pathogen.vim
	echo

	echo "Remove ~/.vimrc additions using sed"
	sed -i '/" MYVIM_START/,/" MYVIM_END/d' ~/.vimrc
	echo

	echo "Remove mydiff"
	rm -fv ~/.vim/bundle/mydiff
	echo

	echo "Remove solarized: " ~/.vim/bundle/vim-colors-solarized-master
	rm -rfv ~/.vim/bundle/vim-colors-solarized
	echo

	echo "Remove vim-json: " ~/.vim/bundle/vim-json-master
	rm -rfv ~/.vim/bundle/vim-json
	echo

	echo "Remove vim-log-syntax: " ~/.vim/bundle/vim-log-syntax-master
	rm -rfv ~/.vim/bundle/vim-log4j
	echo

  read -p "Done"
}

do_install () {
	echo
	# check if already installed? TODO

        # install git
        sudo apt -y install git

        # install neovim
        sudo apt -y install neovim

        # install dein
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
        sh ./installer.sh ~/.vim/bundles

        # install ctags
        sudo apt -y install ctags

        # install vundle
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

        # for deoplete
        sudo apt -y install python34-setuptools
        sudo easy_install-3.4 pip
        pip3 install --upgrade neovim

        # download vimrc
        curl -L https://github.com/seanw2020/.dotfiles/raw/master/.vimrc -o ~/.vimrc

	# symlinks for neovim
        mkdir -p ~/.config
        ln -s ~/.vim ~/.config/nvim
        ln -s ~/.vimrc ~/.config/nvim/init.vim

        echo
	read -p "Done installing"
}

get_input
