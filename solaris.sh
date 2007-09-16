# $Id: linux.sh 1710 2005-02-08 14:17:22Z bmc $

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# `console_vt_pattern' defines the device name pattern for virtual terminals
# on the console.  `.login' uses it and `console_term' to set the default
# terminal type.  If the O/S doesn't support virtual terminals from the
# console, `console_vt_pattern' should be empty.
set console_vt_pattern = "tty[0-9]"
set console_term       = linux

# Path setting
export PATH=$PATH:/usr/X11R6/bin:/usr/sbin:/sbin:/usr/games/bin

# ---------------------------------------------------------------------------
# Linux-specific aliases

# Various aliases are different under Linux:
#	d    - instead of mapping to dl(1), map to ls(1)
#	ls   - use the colorized ls
#	enw  - invoke the "no X11" version of Emacs, to save start-up time
#	lynx - lynx doesn't work well under a color_xterm.  Pop up a regular
#	       xterm to run it in.  Ditto for gopher.
alias ls='ls -CF --color=tty'
eval `dircolors ~/.dir_colors`

alias d=ls
alias gzcat='gunzip -c'
alias ls='ls --color=tty -CF'
alias psme="ps -ef|grep $USER"
alias md5=md5sum
alias time='/usr/bin/time --portability'

_vipw=`type -P vipw`
alias vipw='EDITOR=vi VISUAL=vi sudo $_vipw'

function psf
{
    ps -efww|grep $*
}

if [[ -z "$TERM" ]]
then
    TERM="dumb"
fi
export TERM

# Use xterm1, which avoids the alternate screen buffer. (See /etc/termcap)

case "$TERM" in
    xterm*)
        TERM=xterm1
	;;
esac

# ---------------------------------------------------------------------------
# Linux-specific environment settings

# Note: Setting the default geometry in the .Xdefaults file screws up the
#       xterm menus.  Setting it explicitly on the command line, or resizing
#       an xterm after it comes up, does not.  (Go figure.)  So, instead of
#	including the following line in .Xdefaults, we specify the geometry
#	explicitly on the command line via this XTERM variable.  xlogin and
#	xtelnet will honor that variable, though xterm(1) proper won't.
#
#		XTerm*geometry:	80x44
export XTERM=~/bin/myxterm
#export XTERM=xterm

# xterm uses two text pages.  To prevent loss of last page of less'd output,
# tell less(1) to pause once at EOF.

#export LESS='-aefwiP?f%f:-- More --. ?pB(%pB\%). '

# For man(1) on Linux

export LESSCHARSET=latin1

# Use smaller version of emacs for elm editor.

export ELM_EDITOR=emacs-no-X

# /etc/man.conf takes care of MANPATH
unset MANPATH

# LANG settings appear to slow things down.
unset LANG LC_ALL GDM_LANG