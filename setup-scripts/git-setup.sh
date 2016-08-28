#! /bin/sh
while true; do
  read -p "Do you want to create a gitconfig file now? [y/n]" yn
  case $yn in
    [Yy]* ) read -p "absolute home path:" homepath; read -p "email address:" emadd; cat << EOF > $homepath/.gitconfig
[user]
name = Deon Tan
email = $emadd
[core]
excludesfile = /home/deon/.gitignore
editor = vimx
[alias]
hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
[color]
ui = auto
EOF
break;;
    [Nn]* ) exit;;
    * ) echo "Please enter y or n!";
  esac
done
