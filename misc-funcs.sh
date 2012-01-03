# Misc. shell functions
# ===========================================================================

# ---------------------------------------------------------------------------
# Is the shell ZSH or Bash?
is_zsh()
{
    [ -n "$ZSH_VERSION" ] && return 0
    return 1
}

not_zsh()
{
    is_zsh && return 1
    return 0
}

is_bash()
{
    [ -n "$BASH_VERSION" ] && return 0
    return 1
}

# ---------------------------------------------------------------------------
# Loop over a string and call a function with each individual
# parsed-out string. An additional argument may be passed to the function.
# Keeps looping as long as the function returns 0.

loop_over_var()
{
    _sep=${1?'Missing separator to use'}
    _func=${2?'Missing function to call'}
    _str=${3?'Missing string to parse and loop over'}
    _extra=$4

    if is_zsh
    then
        oldIFS=$IFS
        IFS=$_sep
        for v in ${=_str}
        do
            $_func $v "$_extra"
            [[ $? -eq 0 ]] || break
        done
        IFS=$oldIFS
    else
        extra="$4"
        oldIFS=$IFS
        IFS=$_sep
        set -- $_str
        for v in "$@"
        do
            $_func $v "$extra"
            [[ $? -eq 0 ]] || break
        done
        unset _set _func _str _extra
        IFS=$oldIFS
    fi
}

# ---------------------------------------------------------------------------
# Load arbitrary file. Looks in current directory. Then, if BASH_PATH is set,
# looks in those directories. Doesn't complain if the file isn't found.

_dot_this()
{
    if [ -r "$1/$2" ]
    then
        . "$1/$2"
        return 1
    fi

    return 0
}

# 'load_file' is a conditional 'source' command that searches
# SH_LOAD_FILE_PATH for the file to be loaded. It works for both Bash and
# ZSH.
load_file()
{
    file="$1"
    if [ "$file" != "$(basename $file)" ]
    then
        # Not a simple path. Don't search.

        [[ -r "$file" ]] && . "$file"
    else
        loop_over_var : _dot_this "$SH_LOAD_FILE_PATH" "$file"
    fi
}

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
# "which": Like the old BSD "which" command, sort of. Really, it's a portable
# way to do either "type -p" (zsh) or "type -P" (bash).

which()
{
    : ${1?'Missing command to find'}
    if is_zsh
    then
        whence -p "$1"
    else
        type -P "$1"
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
