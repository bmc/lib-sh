# Functions that operate on PATH variables, and similarly formatted
# variables (LD_LIBRARY_PATH, CLASSPATH, etc)
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Clean one or more path variables of duplicate entries

function cleanpath
{
    : ${1?'Missing name(s) of variables'}

    typeset verbose=

    if interactive
    then
        verbose="-v"
    fi

    declare i=
    for i in $*
    do
        pathclean $verbose -p $i
    done
}

# ---------------------------------------------------------------------------
# Remove an element from a path-like variable.
#
# Usage: rmpath pathvar element [verbose]
#
# "element" can be a wildcard pattern

function rmpath
{
    typeset var=${1?'Missing name of variable'}
    typeset val
    typeset component=${2?'Missing path component to remove'}
    typeset verbose=$3
    typeset tokens
    typeset path

    eval val='$'$var

    if [ -n "$verbose" ]
    then
	echo "Removing $component from $var"
    fi

    # Be sure to disable file name globbing during the set, since
    # it's possible to have glob chars in the data.

    set -o noglob
    tokens=(${val//:/ })
    set +o noglob

    path=
    let i=0
    while [ $i -lt ${#tokens[*]} ]
    do
        if [ -n "$verbose" ]
	then
	    echo "Checking ${tokens[$i]}"
	fi

	if [ "${tokens[$i]}" = "$component" ]
	then
	    if [ -n "$verbose" ]
	    then
		echo "*** match. Removing ${tokens[$i]}"
	    fi
	else
	    path=$path:${tokens[$i]}
	fi

	let i=$i+1
    done

    if [ -n "$verbose" ]
    then
	echo $var=$path
    fi

    eval $var="$path"
}
