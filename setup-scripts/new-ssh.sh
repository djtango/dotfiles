#! /bin/sh
while true; do
  read -p "Generate new SSH Key? [y/n]" yn
  case $yn in
    [Yy]* ) read -p "Enter email address:" em;
            ssh-keygen -t rsa -b 4096 -C "$em";
            echo "Visit https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/ to set up SSH access to GitHub."
            break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done
