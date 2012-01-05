# Bash-only stuff.

# ---------------------------------------------------------------------------
# Personal version of cd(1)

alias cd=chdir
alias up="cd .."
PROMPT_COMMAND=mkprompt

chdir()
{
    _rc=0

    _run_cd_exit_hook
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
    _run_cd_entry_hook
    return $_rc
}