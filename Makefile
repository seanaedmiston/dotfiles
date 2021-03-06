install: install-vim install-bash \
         install-terminal-settings install-git 

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	git submodule init
	git submodule update
	if [ ! -d ~/.vim/sessions ]; then mkdir ~/.vim/sessions; fi

install-bash:
	rm -f ~/.bashrc
	rm -f ~/.bash_profile
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/bash_profile ~/.bash_profile

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

dump-terminal-settings:
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal
	plutil -convert xml1 terminal/com.apple.Terminal.plist

install-terminal-settings:
#ifeq ($(shell uname),Darwin)
#	cp ~/Library/Preferences/com.apple.Terminal.plist terminal/old-settings.bak
#	cp terminal/com.apple.Terminal.plist ~/Library/Preferences
#	@echo "Old terminal settings were saved in terminal folder"
#endif

