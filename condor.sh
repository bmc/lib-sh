# ---------------------------------------------------------------------------
# Settings and overrides specific to host "condor"
# ---------------------------------------------------------------------------
. /etc/rc.conf

export www='/usr/local/site/www'
export wwwtest="$www/wwwtest"
export CVSROOT=/usr/local/src/my-stuff/CVS-tree
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/site/lib
export mystuff=$HOME/src/mystuff
export PYTHONPATH=$HOME/python/lib/python2.6/site-packages
export FORTUNE_FILE=$HOME/lib/games/fortunes
export JAVA_HOME=/usr/local/diablo-jdk1.6.0

export PATH=\
$HOME/python/bin:\
$JAVA_HOME/bin:\
$PATH:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
/usr/X11R6/bin:\
$photos

# Local aliases

alias frm="$(type -P frm) -S"
alias ftp=ncftp
alias top=htop
alias vi=vim
alias www='varcd www'
alias wwwtest='varcd wwwtest'
alias tar=gtar

# ---------------------------------------------------------------------------
# Development stuff

export ANT_HOME=/usr/local/ant
