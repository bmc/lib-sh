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

export NETHACKOPTIONS='pickup_types:$?+!=/'

export www='/usr/local/site/www/apache'
export wwwtest="$www/wwwtest"

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$PATH:\
/usr/X11R6/bin:\
/usr/local/site/bin:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
/usr/local/Acrobat4/bin:\
$HOME/OpenOffice

# ---------------------------------------------------------------------------
# Local aliases and functions

alias frm="$(type -P frm) -S"
alias ftp=ncftp3
alias lynx=links
alias vi=vim
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"
alias www='varcd www'
alias wwwtest='varcd wwwtest'
alias resize='/usr/X11R6/bin/resize'
alias xcolorsel="echo 'try colordemo, instead'"
