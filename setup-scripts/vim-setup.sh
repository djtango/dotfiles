#! /bin/sh

packages=(vim-enhanced\ vim-X11\ python-devel\ python3-devel\ automake\ gcc\ gcc-c++\ kernel-devel\ cmake\ the_silver_searcher)
for package in $packages; do
	while true; do
		read -p "Install $package now? [y/n]" yn
		case $yn in
			[Yy]* ) sudo dnf install $package; break;;
			[Nn]* ) break;;
			* ) echo "Please enter y or n!"
		esac
	done
done
while true; do
	read -p "Install Vundle now? [y/n]" yn
	case $yn in
		[Yy]* ) git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/vim/bundle/Vundle.vim; break;;
		[Nn]* ) break;;
		* ) echo "Please enter y or n!"
	esac
done
while true; do
	read -p "Install Vim Plugins now? [y/n]" yn
	case $yn in
		[Yy]* ) vim +PluginInstall +qall; break;;
		[Nn]* ) break;;
		* ) echo "Please enter y or n!"
	esac
done

while true; do
	read -p "Compile YCM? [y/n]" yn
	case $yn in
		[Yy]* ) ~/.vim/bundle/YouCompleteMe/install.py --clang-completer; break;;
		[Nn]* ) break;;
		* ) echo "Please enter y or n!"
	esac
done
