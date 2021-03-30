#!/bin/bash

usage() { echo "Usage: $0 [-a Will install dotfiles, mkdirs & download tools] [-r rill setup dotfiles only]" 1>&2; exit 1; }

dotfiles() {
	ln -sv "$HOME/dotfiles/.dotfiles/.bashrc" ~
	ln -sv "$HOME/dotfiles/.dotfiles/.aliases" ~
	ln -sv "$HOME/dotfiles/.dotfiles/.evnvars" ~
	ln -sv "$HOME/dotfiles/.dotfiles/.vimrc" ~
	ln -sv "$HOME/dotfiles/.dotfiles/.gitconfig" ~
	ln -sv "$HOME/dotfiles/.dotfiles/.prompt.sh" ~
}

downloadtools() {
	mkdir -p $HOME/gits/tools/
	mkdir -p $HOME/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	git clone https://github.com/so-fancy/diff-so-fancy.git $HOME/gits/tools 
	wget -O $HOME/perl-support.zip https://www.vim.org/scripts/download_script.php?src_id=24473
	unzip $HOME/perl-support.zip -d $HOME/.vim
}

all() {
	dotfiles
	downloadtools	
	pluginstallmsg
}

pluginstallmsg() {
	echo "You will need to enter vim and run :PlugInstall to finish setting up" 1>&2; 
}

while getopts "ar" o; do
    case "${o}" in
        a)
			all
            ;;
        r)
			dotfiles	
            ;;
        *)
            usage
            ;;
    esac
done
if [ $OPTIND -eq 1 ]; then usage; fi
shift $((OPTIND-1))

