.PHONY: build vim-plugins compile-ycm check-cmake cmake python3-dev gcc-cpp vimx zsh ycm-deps cinnamon

vim-plugins:
	@ echo "installing vundle..."
	@ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@ echo "vundle installed, now installing vim plugins...."
	@ vim -c "PluginInstall" -c ":qa"
	@ echo "plugins installed."

compile-ycm: check-cmake
	@ python3 ./vim/bundle/YouCompleteMe/install.py --clang-completer
	@ echo "YouCompleteMe compiled."

CMAKE := $(shell command -v cmake 2> /dev/null)
check-cmake:
ifndef CMAKE
	$(error "cmake is not available please install cmake")
endif
	@ ./check-deps.sh python3-devel || (echo "python3-devel not found"; exit 1)
	@ ./check-deps.sh gcc-c++ || (echo "gcc-c++ not found"; exit 1)

ycm-deps:
	cmake
	python3-dev
	gcc-cpp

cmake:
	sudo dnf install cmake

python3-dev:
	sudo dnf install python3-devel

gcc-cpp:
	sudo dnf install gcc-c++

vimx:
	sudo dnf install vim-X11 vim-enhanced

zsh:
	sudo dnf install zsh
	(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) | sh
	chsh -s /usr/bin/zsh

cinnamon:
	sudo dnf grouplist -v
	sudo dnf install @cinnamon-desktop-environment
