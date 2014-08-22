# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize histappend histreedit histverify extglob

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
#xterm-color)
#    PS1='[ \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] ]\$ '
#    ;;
*)
    PS1='\[\033[0;31m\]$(returncode)\[\033[0;37m\]\[\033[0;35m\]${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[01;37m\]:\[\033[01;36m\]\w$(__git_ps1 " (%s)") >\[\033[0;00m\] '
    ;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=erasedups,ignorespace
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="&:ls:[bf]g: "
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# mint-fortune
/usr/bin/mint-fortune

export SOAPUI_HOME="$HOME/Applications/soapui-4.5.0"
export GRADLE_HOME="$HOME/Applications/gradle-1.8"
export GRAILS_HOME="$HOME/Applications/grails-2.3.3"
export ORACLE_HOME=/opt/oracle/instantclient10_1

source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/rloomans/perl5";
export PERL_MB_OPT="--install_base /home/rloomans/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/rloomans/perl5";
export PERL5LIB="/home/rloomans/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/rloomans/perl5/bin:$PATH";

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/rloomans/.gvm/bin/gvm-init.sh" ]] && source "/home/rloomans/.gvm/bin/gvm-init.sh"
