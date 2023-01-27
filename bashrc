export PATH="$PATH:/opt/ant/bin" # Add apache-ant to PATH
export PATH="$PATH:$HOME/dev-tools/javarepl/bin" #Add javarepl to PATH
export PATH="$PATH:$HOME/dev-tools/idea-IC-143.1184.17/bin" #Add intellij to PATH
export PATH="$PATH:$HOME/dev-tools/scala-2.11.7/bin" #add scala
export PATH="$PATH:$HOME/symlinks" #add symlinks
export PATH="$PATH:/usr/local/racket-6.4/bin"

if [ "$TERM" = "xterm" ]
then
  export TERM=xterm-256color
fi

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export NVM_DIR="$HOME/luckymacro/tools/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
