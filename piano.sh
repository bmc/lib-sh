# ---------------------------------------------------------------------------
# Settings and overrides specific to host "tributary"
# ---------------------------------------------------------------------------
. /etc/rc.conf

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/site/lib
export mystuff=$HOME/src/mystuff

export PATH=\
$HOME/python/bin:\
$PATH:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
/usr/X11R6/bin:\
/usr/local/spamassassin/bin:\
$photos

# Local aliases

alias blog='varcd blog'
alias frm="$(type -P frm) -S"
alias ftp=ncftp
alias play="/usr/local/lib/oss/play"
alias top=htop
alias vi=vim
alias www='varcd www'
alias wwwtest='varcd wwwtest'
alias tar=gtar

# ---------------------------------------------------------------------------
# Development stuff

export ANT_HOME=/usr/local/ant
load_file ~/bash/java.sh
