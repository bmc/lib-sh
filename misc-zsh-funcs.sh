# ZSH-only stuff.

# ---------------------------------------------------------------------------
# Trim a directory. Akin to PROMPT_DIRTRIM in Bash. Takes three parameters
#
# 1 - The string to trim.
# 2 - The maximum number of directory components to include.
# 3 - The total maximum length of the directory string.
#
# An ellipsis is inserted if the string is trimmed because it exceeds either
# constraint 2 or 3.
dir_trim()
{
    : ${1?'Missing directory string'}
    : ${2?'Missing maximum components value'}
    : ${3?'Missing maximum string length value'}

    declare dir_string="$1"
    declare max_components=$2
    declare max_length=$3

    declare tokens
    declare oldIFS=$IFS
    declare s=""
    declare add_ellisis=""

    # Split the directory into its component pieces. This is a ZSH idiom.
    # See the man page section on parameter substitution. The 's' flag is the
    # "split" flag, and the separator is "/" (specified between the two :).
    #
    # The "@" says to treat the resulting array elements as separate words,
    # even though the string is double quoted. This prevents expansion of any
    # shell metacharacters (like ~) that happen to be in the string.
    tokens=( "${(s:/:@)dir_string}" )

    # Reverse the list of tokens. This is another idiom.
    tokens=( "${(Oa@)tokens}" )

    # Extract the last N components.
    declare result
    result=( "${(Oa@)tokens[0,$max_components]}" )

    if (( ${#result} != ${#tokens} )); then
        # Trim the tokens down, from the back, then reverse the array and
        # reassemble.
        dir_string="${(Oaj:/:)result}"
        add_ellipsis="true"
    fi

    # If the string exceeds the maximum string size, we need to trim it.
    if (( ${#dir_string} > $max_length )); then
        # Convert the string to an array, reverse it, trim it, reverse it back.
        tokens=( ${(s::)dir_string} )                  # split
        tokens=( "${(Oa@)tokens}" )                    # reverse
        tokens=( "${(Oa@)tokens[0,$max_length]}" )     # trim
        dir_string="${(Oaj::)tokens}"                  # reassemble
        add_ellipsis="true"
    fi

    if [[ -n "$add_ellipsis" ]]; then
        dir_string="...$dir_string"
    fi

    echo $dir_string
}

mkprompt()
{
    # No-op
}
