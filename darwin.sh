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
export PATH=/opt/local/bin:/usr/local/bin:/sw/bin:$PATH:/usr/sbin:/sbin
#export PKG_CONFIG_PATH=/sw/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export MAIL=/var/mail/$USER

if [[ -z $?TERM ]]
then
    TERM="dumb"
fi
export TERM

if [[ "$TERM" == xterm* ]]
then
    term xterm1
fi

if [[ -z $PERL5LIB ]]
then
    export PERL5LIB=/usr/local/lib/perl
fi

export PERL5LIB=${PERL5LIB}:$HOME/lib/perl
export LSCOLORS='3x6x5x2x2x3x3x2x2x3x3x'

unset MANPATH	# /etc/manpath.config takes care of it

# LOGIN_RHOST is set by bashrc

if [ -z "$LOGIN_RHOST" ]
then
    # Local login. Check tty. If it's not a pseudo-tty, then assume we're
    # not running under X, and clear the display.

    case "`tty`" in
	/dev/ttyp*)
	    ;;
	*)
	    unset DISPLAY
	    ;;
    esac
fi

# ---------------------------------------------------------------------------
# Aliases and functions

# Assume that all OS X machines have the fileutils port installed.
eval `dircolors ~/.dir_colors`

_fetch=$(type -P fetch)
alias fetch="$_fetch -p"
unset _fetch

alias hping2=hping
alias ls='/sw/bin/ls --color=tty -CF'
alias mllog="sudo tail -f /var/log/mail.log"
alias mslog="sudo tail -f /var/log/system.log"
alias nsr='netstat -rn -f inet'
alias routes=nsr
alias psme='ps -U bmc -ww -ouser,pid,ppid,tty,command'
alias sgrep=sgrep2
alias sha1='digest sha1'
alias sha224='digest sha224'
alias sha256='digest sha256'
alias sha384='digest sha384'
alias sha512='digest sha512'
alias time='/usr/bin/time --portability'
alias unshar=gunshar
alias xs='eval `resize -u`'

_vipw=`type -P vipw`
alias vipw='EDITOR=vi VISUAL=vi sudo $_vipw'

function pki
{
    pkg_glob -O -a | grep -i $*
}

function psf
{
    ps -axww -opid,ppid,vsz,rss,user,tty,command|egrep "PID|$1"
}

