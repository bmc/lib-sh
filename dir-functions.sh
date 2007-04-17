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

function popd
{
    builtin popd $*
    owd=$OLDPWD
    mkprompt
}

function pushd
{
    builtin pushd $*
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
