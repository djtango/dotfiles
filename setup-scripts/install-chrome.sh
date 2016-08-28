#! /bin/sh
while true; do
  read -p "Do you want to install chrome [Fedora] now? [y/n]" yn
  case $yn in
    [Yy]* ) cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
            dnf install google-chrome-stable;
            break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done
