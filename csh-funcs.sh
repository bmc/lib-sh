# $Id$
#
# KSH functions to emulate various C-shell things.
# ---------------------------------------------------------------------------

setenv()
{
    var=$1
    shift
    export $var="$@"
    unset var
}

unsetenv()
{
    eval unset $1
}

source()
{
    . $1
}
