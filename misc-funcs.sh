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
