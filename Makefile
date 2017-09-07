.PHONY: build

build:
	@ echo "installing vundle..."
	@ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@ echo "vundle installed, now installing vim plugins...."
	@ vim -c "PluginInstall" -c ":qa"
	@ echo "plugins installed."
	@ echo "Compiling YouCompleteMe..."
	@ ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
	@ echo "YouCompleteMe compiled."
