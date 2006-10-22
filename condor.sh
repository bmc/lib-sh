# ---------------------------------------------------------------------------
# Settings and overrides specific to host "tributary"
# ---------------------------------------------------------------------------
. /etc/rc.conf

export blog="$BLOG_CHROOT_TOP/usr/local/apache2/htdocs/bmc/blog"
export www='/usr/local/site/www/apache'
export wwwtest="$www/wwwtest"
export CVSROOT=/usr/local/src/my-stuff/CVS-tree
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/site/lib
export CATALINA_HOME=/usr/local/jakarta-tomcat5.0

export PATH=\
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
alias vi=vim
alias www='varcd www'
alias wwwtest='varcd wwwtest'

# ---------------------------------------------------------------------------
# Development stuff

export ANT_HOME=/usr/local/ant
load_file ~/bash/java.sh
