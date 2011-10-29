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
        verbose="1"
    fi

    declare i=
    for i in $*
    do
        [[ -n "$verbose" ]] && echo "Cleaning $i"
        _clean_one_path $i
    done
}

function _clean_one_path
{
    : ${1?'Missing name of variable'}

    declare pathvar=$1
    oldIFS=$IFS
    IFS=:
    eval 'set -- $'$pathvar
    IFS=$oldIFS

    declare new_path=
    declare sep=
    declare -A seen
    declare i=

    for i in "$@"
    do
        # Skip blank entries.
        if [[ -z "$i" ]]
        then
            continue
        fi

        # Replace all / in the path with something else, because we're using
        # it as a hash key, and bash will bitch if there are slashes in the
        # hash key (i.e., subscript)
        j=${i//\//@}
        if [[ -n "${seen[$j]}" ]]
        then
            # Already saw this one. Skip it.
            continue
        fi
        seen[$j]=1
        new_path="${new_path}${sep}${i}"
        sep=:
    done
    eval $pathvar='"'$new_path'"'
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
