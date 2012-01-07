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
# If BASH_CD_HOOKS is defined, then these commands look for .on-entry.bash and
# .on-exit.bash files, which are source upon entry and exit in a directory.
# ---------------------------------------------------------------------------

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

if is_bash; then
    function popd
    {
        _run_cd_entry_hook
        builtin popd $*
        owd=$OLDPWD
        mkprompt
        _run_cd_exit_hook
    }

    function pushd
    {
        _run_cd_exit_hook
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
        _run_cd_entry_hook
    }
fi

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

# Simple aliases for the above beasties.

alias xd=pushd
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
