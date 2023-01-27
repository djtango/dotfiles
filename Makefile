.PHONY: build vim-plugins compile-ycm check-cmake cmake python3-dev gcc-cpp vimx zsh ycm-deps cinnamon chrome

vim-plugins:
	@ echo "installing vundle..."
	@ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@ echo "vundle installed, now installing vim plugins...."
	@ vim -c "PluginInstall" -c ":qa"
	@ echo "plugins installed."

compile-ycm: check-cmake
	@ python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer --ts-completer --java-completer
	@ echo "YouCompleteMe compiled."

CMAKE := $(shell command -v cmake 2> /dev/null)
check-cmake:
ifndef CMAKE
	$(error "cmake is not available please install cmake")
endif
	@ ./check-deps.sh python3-devel || (echo "python3-devel not found"; exit 1)
	@ ./check-deps.sh gcc-c++ || (echo "gcc-c++ not found"; exit 1)

ycm-deps: cmake python3-dev gcc-cpp

cmake:
	sudo dnf install -y cmake

python3-dev:
	sudo dnf install -y python3-devel

gcc-cpp:
	sudo dnf install -y gcc-c++

vimx:
	sudo dnf install -y vim-X11 vim-enhanced

zsh:
# installing oh my zsh nukes old zshrc symlink
	sudo dnf install zsh
	(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) | sh
	chsh -s /usr/bin/zsh

cinnamon:
	sudo dnf grouplist -v
	sudo dnf install -y @cinnamon-desktop-environment

chrome:
	sudo dnf install -y fedora-workstation-repositories
	sudo dnf config-manager --set-enabled google-chrome
	sudo dnf install -y google-chrome-stable

luckymacro:
	mkdir -p ~/luckymacro

tools: luckymacro
	mkdir -p ~/luckymacro/tools

nvm: tools
	mkdir -p ~/luckymacro/tools/nvm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | NVM_DIR="/home/deon/luckymacro/tools/nvm" bash

mono-fonts:
# https://utcc.utoronto.ca/~cks/space/blog/linux/Fedora36FontconfigMystery?showcomments
	sudo dnf install -y dejavu-*-fonts
	cp shim-fedora-cinnamon-fonts.conf ~/.config/fontconfig/fonts.conf
# cp 57-dejavu-sans-mono-fonts.conf 49-cks-dejavu-sans-mono-fonts.conf

xclip:
	sudo dnf install -y xclip

symlinks:
	ln -sf /home/deon/luckymacro/github/djtango /home/deon/djtango

docker:
	sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	sudo groupadd docker
	sudo usermod -aG docker $USER
