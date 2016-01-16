export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/opt/ant/bin" # Add apache-ant to PATH
export PATH="$PATH:$HOME/dev-tools/javarepl/bin" #Add javarepl to PATH
export PATH="$PATH:$HOME/dev-tools/idea-IC-143.1184.17/bin" #Add intellij to PATH
export PATH="$PATH:$HOME/dev-tools/scala-2.11.7/bin"

if [ "$TERM" = "xterm" ]
then
  export TERM=xterm-256color
fi
