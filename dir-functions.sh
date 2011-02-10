# ---------------------------------------------------------------------------
# Bash equivalents of some Korn shell directory functions I've been using.
#
# The following functions are provided:
#
#    pu, pushd   - move to another directory, pushing current directory
#                  onto directory stack
#    po, popd    - change directory to top element of directory stack, popping
#                  the stack by one element
#    xd, exchd   - exchange top two elements of directory stack where current
#                  directory is considered to be at the top of the stack
#                  (equivalent to "pushd" with no arguments in the C shell)
#    lsd, lrotd  - rotate entire directory stack left one element
#                  (equivalent to "pushd +1" in the C shell)
#    rsd, rrotd  - rotate entire directory stack right one element
#    dirs        - print out current directory stack
#
# $Revision$
# $Date: 2006-11-22 12:31:14 -0500 (Wed, 22 Nov 2006) $
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Personal version of cd(1)

alias cd=chdir
alias up="cd .."
PROMPT_COMMAND=mkprompt

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
	builtin cd -P "$*"
	if [ $? != 0 ]
	then
	    #echo "Bad directory: $*" >&2
	    _rc=1
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

function popd
{
    builtin popd $*
    owd=$OLDPWD
    mkprompt
}

function pushd
{
    case $# in
        0)
            builtin pushd
            ;;
        *)
            builtin pushd "$@"
            ;;
    esac
    owd=$OLDPWD
    mkprompt
}

function lrotd
{
    pushd +1
    owd=$OLDPWD
    mkprompt
}

function rrotd
{
    pushd -1
    owd=$OLDPWD
    mkprompt
}		

function exchd
{
    pushd
    owd=$OLDPWD
    mkprompt
}

# Simple aliases for the above beasties.

alias xd=exchd
alias pd=pushd
alias pu=pushd
alias po=popd
alias lsd=lrotd
alias rsd=rrotd

# Others

function back
{
    cd "$OLDPWD"
    owd=$OLDPWD
}

function abspath
{
    : ${1?'Usage: abspath file var'}
    : ${2?'Usage: abspath file var'}

    typeset here=$PWD
    if [[ -d $1 ]]
    then
	cd "$1" || return 1
	eval $2="$PWD"
    else
        typeset dir=$(dirname $1)
        typeset f=$(basename $1)

        if [[ -n $dir ]]
        then
            cd "$dir" || exit 1
        fi
        if [[ $dir == "/" ]]
        then
            eval $2="/$f"
        else
            eval $2="$PWD/$f"
        fi
    fi
    cd $here
}
