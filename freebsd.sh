# $Id$

# ---------------------------------------------------------------------------
# Local variables

# `console_vt_pattern' defines the device name pattern for virtual terminals
# on the console.  `.login' uses it and `console_term' to set the default
# terminal type.  If the O/S doesn't support virtual terminals from the
# console, `console_vt_pattern' should be empty.
console_vt_pattern="ttyv[0-9]"
console_term=cons25

# ---------------------------------------------------------------------------
# Environment variables

# Path setting
export PATH=$PATH:/usr/sbin:/sbin 

export MAIL=/var/mail/$USER

if [[ -z $?TERM ]]
then
    TERM="dumb"
fi
export TERM

if [[ "$TERM" == xterm* ]]
then
    term xterm
fi

if [[ -z $PERLLIB ]]
then
    export PERLLIB=/usr/local/lib/perl
fi

export PERLLIB=${PERLLIB}:$HOME/lib/perl
export LSCOLORS='3x6x5x2x2x3x3x2x2x3x3x'

unset MANPATH	# /etc/manpath.config takes care of it

# ---------------------------------------------------------------------------
# Aliases and functions

# Assume that all FreeBSD machines have the gnuls port installed.
eval `dircolors ~/.dir_colors`

_fetch=$(type -P fetch)
alias fetch="$_fetch -p"
unset _fetch

alias hping2=hping
alias ls='gnuls --color=tty -CF'
alias psme='ps -U bmc -ouser,pid,ppid,command'
alias sha1='digest sha1'
alias time='/usr/bin/time --portability'
alias unshar=gunshar
alias xs='eval `resize -u`'

_vipw=`type -P vipw`
alias vipw='EDITOR=vi VISUAL=vi sudo $_vipw'

function pki
{
    pkg_info -Ia|grep -i $*
}

function psf
{
    ps -agx -opid,ppid,user,command | grep "$@"
}

