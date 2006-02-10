# Misc. Korn shell functions
#
# $Id$
# ===========================================================================

# ---------------------------------------------------------------------------
# Set X Windows display

xdisplay()
{
    if [ -n "$1" ]
    then
        export DISPLAY=${1/:0.0/}:0.0
    else
        echo DISPLAY=$DISPLAY
    fi
}

# ---------------------------------------------------------------------------
# The shell is interactive if the list of command-line options (in shell
# built-in variable $-) contains an "i".

interactive()
{
    case "$-" in
        *i*)
            return 0
	    ;;
	*)
	    return 1
	    ;;
    esac
}

# ---------------------------------------------------------------------------
# Load arbitrary file

load_file()
{
    if [ -r $1 ]
    then
        . $1
    fi
}

# ---------------------------------------------------------------------------
# Command/function to set and initialize terminal

term()
{
    unset TERMCAP
    _term=$1
    if [ -z $_term ]
    then
        _term=$TERM
    fi
    export TERM=$_term
    unset _term

    tput is1
    tput is2

    if [ $TERM == xterm* ]
    then
        eval xs
    fi

    load_file $HOME/termcap/$TERM.sh
    export LINES=`tput lines`
    export COLUMNS=`tput cols`

    if [ -z $LINES ]
    then
	unset LINES
    fi

    if [ -z $COLUMNS ]
    then
	unset COLUMNS
    fi
}

# ---------------------------------------------------------------------------
# Get user's real home directory. Useful when home dir is a symlink to
# something else.

getHome()
{
    builtin cd -P ~
    eval $1=$PWD
    cd $OLDPWD
}

# ---------------------------------------------------------------------------
# Create a prompt string. If max_prompt_len is set, the prompt won't
# exceed that length (give or take a few characters); an ellipsis will be
# inserted in place of the first N path components.
#
# NOTE: 'typeset' will create a local variable, but only if the function
# is defined with "function name", rather than "name()".

function mkprompt
{
    if [[ $TERM == xterm* ]]
    then
	echo -e "\033]2;${HOST}:${PWD/$HOME/~}\007\c"
    fi

    PS1="($HOST:$USER) ${PWD/$HOME/~} $_prompt "

    if [ -n "$max_prompt_len" ]
    then
        # A maximum prompt length is defined. Determine whether we need
	# to elide parts of the prompt

        l=${#PS1}
        if [ $l -gt $max_prompt_len ]
	then
	    # Prompt too long. Ellipsis is necessary.

	    declare pwd=${PWD/$HOME/~}
	    declare tokens
	    declare p
	    declare i

	    # Split the current working directory into space-delimited tokens.
            # Be sure to account for any existing spaces in the directory name.

            p=$(echo "$pwd" | sed 's/ /?/g')
	    tokens=(${p//\// })	# array of tokens in prompt
	    p='('$HOST':'$USER') '
	    let i=${#tokens[*]}-1 # index of highest token

	    # Figure out which tokens from the path will fit, starting from
	    # the back and working to the front. The current prompt length
	    # is length of prefix + prompt character + space + room for
	    # ellipsis.
	    let l=${#p}+${#_prompt}+1+3
	    while [ $l -lt $max_prompt_len -a $i -ge 0 ]
	    do
	        let l=$l+${#tokens[$i]}
		let i=$i-1
	    done

	    if [ $i -le 0 ]
	    then
	        # no ellipsis; prompt small enough
		:
	    else
	        p="$p..."

		# Start one past where "i" left off, and add in the
		# directory tokens

		let i=$i+1
		while [ $i -lt ${#tokens[*]} ]
		do
		    p="$p/${tokens[$i]}"
		    let i=$i+1
		done
		p="$p $_prompt "
                p=$(echo "$p" | sed 's/?/ /g')
		PS1=$p
	    fi
        fi
    fi
}

# ---------------------------------------------------------------------------
# Personal version of cd(1)

alias cd=chdir

chdir()
{
    _rc=0

    if [ $# = 0 ]
    then
	builtin cd -P ~
	if [ $? != 0 ]
	then
	    echo "Bad directory: $HOME" >&2
	    _rc=1
	fi
    else
	if [ ! -d "$*" ]
	then
	    echo "Bad directory: $*" >&2
	    _rc=1
	else
	    builtin cd -P "$*"
	    if [ $? != 0 ]
	    then
		echo "Bad directory: $*" >&2
	        _rc=1
	    fi
	fi
    fi
    owd=$OLDPWD
    cwd=$PWD
    mkprompt
    return $_rc
}

# ---------------------------------------------------------------------------
# Manage aliases for directories that are driven from environment variable
# settings. Aliases that use this function are defined as follows:
#
#     alias www='envcd www'
#
# This permits command 'www' that changes to the directory defined by
# variable $www. Additional parameters are applied to the 'cd' command as
# subdirectories.

varcd()
{
    : ${1?'missing environment variable parameter'}

    eval _dir='$'$1
    shift
    for _i in $*
    do
        _dir="$_dir/$_i"
    done

    chdir $_dir
    if [ $? != 0 ]
    then
        echo "$_dir: bad directory" >&2
    fi
    unset _dir _i
}

# ---------------------------------------------------------------------------
# Format man page on the fly

manf()
{
    nroff -man $1.[1-8m]* | $pager
}

# ---------------------------------------------------------------------------
# Tail a log file

taillog()
{
    : ${1?'missing log file parameter'}

    echo "+ tail -f $1"
    tail -f $1
}

# ---------------------------------------------------------------------------
# Determine whether to recommend tethereal over tcpdump

unset -f tcpdump
tethereal=$(type -P tethereal)

tcpdump()
{
    echo "Try tethereal ($tethereal)"
}

if [ -z $tethereal ]
then
    unset -f tcpdump
fi
