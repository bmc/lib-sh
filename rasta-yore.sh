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

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/site/lib

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
# Local aliases and functions

alias ftp=ncftp3
alias lynx=links
alias vi=vim
alias resize='/usr/X11R6/bin/resize'
alias xcolorsel="echo 'try colordemo, instead'"
