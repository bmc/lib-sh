# $Id$

# ---------------------------------------------------------------------------
# Environment variables

if [ -z $PERL5LIB ]
then
    export PERL5LIB=/usr/local/lib/perl
else
    export PERL5LIB=$PERL5LIB:/usr/local/lib/perl
fi
export MAKE_BASE="/usr/local/src/mystuff/working/libs"
export MAKE_CFG="$MAKE_BASE/make"
#export EMACS_SHOW_TIME="yes"

export CVSROOT=/usr/local/src/my-stuff/CVS-tree
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
# Local X stuff

export XMCD_LIBDIR=/usr/local/X11/lib/xmcd

# ---------------------------------------------------------------------------
# Local aliases and functions

alias frm="$(type -P frm) -S"
alias ftp=ncftp3
alias lynx=links
alias mplayerxp="mplayerxp -xp -double"
alias play="/usr/lib/oss/play"
alias vi=vim
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"
alias www='varcd www'
alias wwwtest='varcd wwwtest'
alias resize='/usr/X11R6/bin/resize'
alias xcolorsel="echo 'try colordemo, instead'"

# ---------------------------------------------------------------------------
# Development stuff

export wsrc='/usr/local/src/mystuff/working'
alias wsrc='varcd wsrc'

load_file ~/bash/development.sh
