# $Id$

# ---------------------------------------------------------------------------
# Environment variables

if [ -z $PERL5LIB ]
then
    export PERL5LIB=/usr/local/lib/perl
else
    export PERL5LIB=$PERL5LIB:/usr/local/lib/perl
fi
#export EMACS_SHOW_TIME="yes"

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$PATH:\
/usr/X11R6/bin:\
/usr/local/site/bin:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:

# ---------------------------------------------------------------------------
# Local X stuff

export XMCD_LIBDIR=/usr/local/X11/lib/xmcd

# ---------------------------------------------------------------------------
# Local aliases and functions

alias frm="$(type -P frm) -S"
alias ftp=ncftp3
alias lynx=links
alias play="/usr/lib/oss/play"
alias vi=vim
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"
alias www='varcd www'
alias wwwtest='varcd wwwtest'
alias resize='/usr/X11R6/bin/resize'
alias xcolorsel="echo 'try colordemo, instead'"

PATH=$PATH:/compat/linux/bin:/compat/linux/sbin:/compat/linux/usr/bin
PATH=$PATH:/compat/linux/usr/sbin:/bin:/sbin:/usr/bin:/usr/sbin
