DIR=~/dotfiles

all: symlinks clone_vundle completion
	@echo "Reminder: Vim plugins are managed within Vim with Vundle."

symlinks:
	@ln -sf $(DIR)/bash/bash_profile ~/.bash_profile
	@ln -sf $(DIR)/bash/inputrc ~/.inputrc
	@ln -nsf $(DIR)/vim/vim ~/.vim
	@ln -sf $(DIR)/vim/vimrc ~/.vimrc
	@ln -sf $(DIR)/git/gitconfig ~/.gitconfig
	@ln -sf $(DIR)/git/gitignore_global ~/.gitignore_global
	@ln -sf $(DIR)/.screenrc ~/.screenrc
	@ln -sf $(DIR)/.colordiffrc ~/.colordiffrc

clone_vundle: symlinks
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

completion:
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
