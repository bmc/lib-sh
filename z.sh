# ---------------------------------------------------------------------------
# Settings and overrides specific to host "z"
# ---------------------------------------------------------------------------
export www='/usr/local/site/www/apache'
export wwwtest="$www/wwwtest"
export CVSROOT=/usr/local/src/my-stuff/CVS-tree
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/site/lib

export EDITOR=vim
export VISUAL=$EDITOR

export PATH=\
$PATH:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
/usr/X11R6/bin:\
/usr/local/spamassassin/bin

# Local aliases

alias frm="$(type -P frm) -S"
alias ftp=ncftp
alias play="/usr/local/lib/oss/play"
alias vi=vim
alias www='varcd www'
alias wwwtest='varcd wwwtest'
