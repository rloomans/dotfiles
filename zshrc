# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search command-not-found zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:$PATH
export PATH='/opt/firefox':$PATH
export TERM=xterm-256color 
alias l='ls -l'
unsetopt correct_all

# tricks so that ctrl-s works in vim
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
alias mvn-jetty-debug='MAVEN_OPTS="-XX:MaxPermSize=2048m -Xrunjdwp:transport=dt_socket,address=8000,server=y" mvn jetty:run'
alias mysql="mysql --pager='less -n -i -S -F -X'"
alias l=ls
export ORACLE_HOME=/opt/instantclient
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME:/opt/Eracom/lib

export CLASSPATH=$CLASSPATH:/usr/share/java/libreadline-java.jar
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jni/

#alias ijython='/home/jsweeney/jython/bin/ipython'

export PAGER='less -n -i -S -F -X'
export PYTHONPATH=$PYTHONPATH:/home/jsweeney/python
#export JAVA_HOME=/usr/lib/jvm/java-6-sun

export GIT_PS1_SHOWDIRTYSTATE=true
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONPATH=$PYTHONPATH:/home/jsweeney/pylib

# this seems to be needed by vim Powerline for colors to work
# not sure why...!
#export TERM="xterm-256color"

# function _fab_complete() { 
#     local cur 
 #    cur="${COMP_WORDS[COMP_CWORD]}" 
#     COMPREPLY=( $(compgen -W "$(fab -F short -l)" -- ${cur}) ) 
#     return 0 
# } 

# enable programmable completion features (you don't need to enable 
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile 
# sources /etc/bash.bashrc). 

# dircolors for solarized from:
# curl https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
