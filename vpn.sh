#!/bin/bash
#
# Front end to openvpn command line.
# ---------------------------------------------------------------------------

usage()
{
    cat >&2 <<EOF
Usage: $(basename $0) [vpnname | list]
EOF
}

die()
{
    echo "$@" >&2
    exit 1
}

list()
{
    cd $VPN_ETC
    vpns=
    for i in $(/bin/ls -1)
    do
        if [ -d $i -a -f $i/openvpn.conf ]
        then
            vpns="$vpns $i"
        fi
    done
    echo $vpns
}

case "$#" in
    1)
        ;;

    *)
        usage
        exit 1
        ;;
esac

VPN_ETC=$HOME/openvpn
if [ ! -d $VPN_ETC ]
then
    die "Can't find directory $VPN_ETC"
fi

if [ "$1" = "list" ]
then
    list
else
    vpn=$1
    here=$(pwd)
    cd $VPN_ETC
    eval set -- $1'*'
    cd $here

    # For each directory that matches whatever was passed in,
    # choose only the ones that have an openvpn.conf

    declare -a matches # a bash array
    let i=0
    for d in $*
    do
        if [ ! -d $VPN_ETC/$d ]
        then
            continue
        fi

        if [ ! -f $VPN_ETC/$d/openvpn.conf ]
        then
            continue
        fi

        # Append to array. See
        # http://fvue.nl/wiki/Bash:_Append_to_array_using_while-loop
        # and
        # http://www.poundbangwhack.com/2010/02/04/how-to-append-values-to-an-array-in-bash/

        matches=( ${matches[@]-} [$i]=$(basename $d) )
        let i=$i+1
    done

    # Shell array syntax is so effed...
    total_matches=${#matches[@]}

    case $total_matches in
        0)
            die "No VPN configuration matches \"$vpn\"."
            ;;

        1)
            d=${matches[0]}
            conf=$VPN_ETC/$d/openvpn.conf
            if [ ! -f $conf ]
            then
                die "No $conf found"
            fi
            cmd="sudo openvpn --config $conf --script-security 2"
            cd $VPN_ETC/$d
            pwd
            echo $cmd
            exec $cmd
            ;;

        *)
            die "Multiple VPN directories match \"$vpn\": $*"
            ;;
    esac
fi
