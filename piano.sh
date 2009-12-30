# ---------------------------------------------------------------------------
# Settings and overrides specific to host "piano"
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
/sbin

# Local aliases

alias ftp=ncftp
alias top=htop
alias vi=vim
alias tar=gtar

