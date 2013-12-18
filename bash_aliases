realias ()
{
    vim ~/.bash_aliases;
    source ~/.bash_aliases
}

alias dnstracer="dnstracer -C -o "

alias mmv="mmv -v"

alias diff='diff -u'
alias rcsdiff='rcsdiff -u'

pt ()
{
    (
        #set -vx

	local quiet=1

	if [ "$1" == "-v" ]; then
	    quiet=''
	    shift
	fi

        for i in "$@"; do
	    (
		trap "rm -vf \"$i.tdy\" \"$i.old\" \"$i.ERR\"" EXIT
		cp "$i" "$i.old"
		perltidy "$i"
		while [ -f "$i.ERR" ]; do
		    vim -o "$i" "$i.ERR"
		    rm -f "$i.ERR"
		    perltidy "$i"
		done
		if ! (diff -q "$i" "$i".tdy >/dev/null); then
		    [ -n "$quiet" ] || diff "$i" "$i".tdy | diffstat
		    vimdiff "$i" "$i".tdy
		fi
		if ! (diff -q "$i".old "$i" >/dev/null); then
		    [ -n "$quiet" ] || diff "$i".old "$i" | diffstat
		fi
	    )
        done
    )
}

# "repeat" command.  Like:
#
#       repeat 10 echo foo
repeat ()
{
    local count="$1" i;
    shift;
    for i in $(_seq 1 "$count");
    do
	eval "$@";
    done
}

# Subfunction needed by `repeat'.
_seq ()
{
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -le $upper ];
    do
	echo -n "$lower "
	lower=$(($lower + 1))
    done
    echo "$lower"
}

truncate_pwd ()
{
 if [ "$HOME" == "$PWD" ]
 then
   newPWD="~"
 elif [ "$HOME" ==  "${PWD:0:${#HOME}}" ]
 then
   newPWD="~${PWD:${#HOME}}"
 else
   newPWD="$PWD"
 fi

  local pwdmaxlen=40
  if [ ${#newPWD} -gt $pwdmaxlen ]
  then
    local pwdoffset=$(( ${#newPWD} - $pwdmaxlen  ))
    newPWD=".+${newPWD:$pwdoffset:$pwdmaxlen}"
  fi
}


alias rlsqlplus='rlwrap /opt/oracle/instantclient10_1/sqlplus'
