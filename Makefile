.PHONY: install clean copy-conf clean-conf
GITST=$(shell git status -s)

clean: clean-conf

clean-conf:
	rm -f ~/.gitconfig
	rm -f ~/.vimrc
	rm -f ~/.zshrc
	rm -f ~/.compton.conf
	rm -f ~/.pythonstartup.py

copy-conf:
	cp .gitconfig ~/.
	cp .vimrc ~/.
	cp .zshrc ~/.
	cp .compton.conf ~/.
	cp .pythonstartup.py ~/.

install: clean copy-conf
