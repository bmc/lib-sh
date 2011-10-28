# Misc. Korn shell functions
#
# $Id$
# ===========================================================================

# ---------------------------------------------------------------------------
# Portable readlink

xreadlink()
{
    case "$PLATFORM" in
        darwin|freebsd)
            readlink -n $1
            ;;
        linux)
            readlink -n -e $1
            ;;
        *)
            echo "xreadlink: Unknown platform: $PLATFORM" >&2
            return 1
    esac
}

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

let _lf=0
load_file()
{
    if [ -r "$1" ]
    then
        let _lf=${_lf}+1
        #echo "($_lf) Loading $1..."
        . "$1"
        let _lf=${_lf}-1
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

    if [ $TERM == 'xterm*' ]
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
    # windows-specific
    eval $1="'$HOME'"

    #builtin cd -P "$HOME"
    #eval $1="'$PWD'"
    #cd "$OLDPWD"
}

# ---------------------------------------------------------------------------
# Create a prompt string. If max_prompt_len is set, the prompt won't
# exceed that length (give or take a few characters); an ellipsis will be
# inserted in place of the first N path components.
#
# NOTE: 'typeset' will create a local variable, but only if the function
# is defined with "function name", rather than "name()".

PROMPT_DIRTRIM=3
function mkprompt
{
    if [[ $TERM == xterm* ]]
    then
	echo -e "\033]2;${HOST}:${PWD/#$HOME/~}\007\c"
    fi

    # Hack. Fails on FreeBSD. Just returning, though, works fine.
    #if [ "$PLATFORM" = "freebsd" ]
    #then
        #return
    #fi

    _prefix='\[\e[1m\]'
    _suffix='\[\e[m\]'
    #PS1="$_prefix"'($HOST:\u) ${PWD/$HOME/~} '"$_prompt $_suffix"
    PS1="$_prefix($HOST:\u) \w $_prompt $_suffix"


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

            p=$(echo "$PWD" | sed 's/ /?/g')
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
		PS1=$_prefix$p"$_suffix"
	    fi
        fi
    fi
}

alias stp=mkprompt

# ---------------------------------------------------------------------------
# Format man page on the fly

manf()
{
    nroff -man $1.[1-8m]* | $pager
}
