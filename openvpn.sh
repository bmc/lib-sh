# OpenVPN functions
#
# Sourcing this file enables completions on the $VPN_START command.
#
# Assumption:
#     The $VPN_START command takes one parameter: The name of the VPN,
#     which corresponds to a directory containing all the OpenVPN client
#     configuration files for the VPN.
#
# Variables:
#
#     VPN_START          name of VPN start script. Default "vpn"
#
#     OPENVPN_CONF_ROOT  directory containing OpenVPN configuration 
#                        subdirectories. The subdirectory names are what
#                        the completion logic uses. Default: $HOME/openvpn
# ---------------------------------------------------------------------------

: ${OPENVPN_CONF_ROOT:=$HOME/openvpn}
: ${VPN_START:=vpn}

unset -f _get_vpn_completions
_get_vpn_completions()
{
    local cur prev possibles
    # "cur" is the current word (the one being completed)
    cur="${COMP_WORDS[COMP_CWORD]}"
    # prev is the previous word type. We don't use that here.
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # COMPREPLY is a bash array in which the responses are returned
    COMPREPLY=()

    # Generate the list of possible matches (i.e., the directories under
    # $HOME/openvpn
    possibles=
    for f in $OPENVPN_CONF_ROOT/*
    do
        if [ -d $f ]
        then
            possibles="$possibles $(basename $f)"
        fi
    done

    # Now, use the compgen built-in to generate the matches
    COMPREPLY=( $(compgen -W "$possibles" -- $cur) )
}
# enable completions on command "vpn"
complete -F _get_vpn_completions $VPN_START
