export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/opt/ant/bin" # Add apache-ant to PATH
export PATH="$PATH:$HOME/dev-tools/javarepl/bin" #Add javarepl to PATH

if [ "$TERM" = "xterm" ]
then
  export TERM=xterm-256color
fi
