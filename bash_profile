# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# include .bashrc if it exists

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=erasedups,ignorespace
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="&:ls:[bf]g: "
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

export FIGNORE="~:.svn"

export LESS="--max-back-scroll=5 --ignore-case --quit-at-eof --LONG-PROMPT --squeeze-blank-lines --clear-screen --RAW-CONTROL-CHARS"
export EDITOR=vim

export PAGER=less

export CVS_RSH=ssh
export RSYNC_RSH=ssh
export RSH=ssh

export BC_ENV_ARGS="--quiet $HOME/.bcrc"

if [ -z "$SSH_TTY" -a -z "$DISPLAY" ]; then
    X11_FOLDER=/tmp/.X11-unix
    if [ -d "$X11_FOLDER" ]; then
	display=$(/bin/ls -l $X11_FOLDER 2>/dev/null | grep $USER | sed -e 's/^.*X\([0-9]*\)$/\1/')
    fi
    export DISPLAY=:${display:-0}.0
fi

umask 002

if [ -n "$PS1" ]; then

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
	    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/$HOME/~}\007"'
	    ;;
    screen)
	    PROMPT_COMMAND='echo -ne "\033k${PWD/$HOME/~}\033\\"'
	    ;;
    *)
	    ;;
    esac

    export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER "$(history 1)" >> ~/.bash_eternal_history; history -a'

    if [ -n "$SSH_AUTH_SOCK" ]; then
	if ! /usr/bin/ssh-add -l >/dev/null; then
	    /usr/bin/ssh-add -k >/dev/null
	fi
    fi
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    ls --color=auto >/dev/null 2>&1 && export LS_OPTIONS="--color=auto"

    (echo | grep --color=auto testing >/dev/null 2>&1) && export GREP_OPTIONS="--color=auto"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize histappend histreedit histverify extglob

source ~/.git-prompt.sh
export -f __gitdir __git_ps1_show_upstream __git_ps1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/rloomans/.gvm/bin/gvm-init.sh" ]] && source "/home/rloomans/.gvm/bin/gvm-init.sh"
