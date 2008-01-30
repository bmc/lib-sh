# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id: sunball.sh 6675 2007-04-17 01:19:20Z bmc $
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=$HOME/lib/perl
export www=/usr/local/www
export blog="/mnt/condor/site/chroot/apache/usr/local/apache2/htdocs/bmc/blog"
export APACHE_HOME=$www
export invsrc=$HOME/src/invitemedia
export usr_local_site=/mnt/condor/site

# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Java-related environment variables

export JAVA_ROOT=$HOME/java
export ANT_HOME=$JAVA_ROOT/ant

if [ -n "$JAVA_HOME" ]
then
    rmpath PATH "$JAVA_ROOT/jdk*/bin"
else
    export JAVA_HOME=$JAVA_ROOT/jdk
fi

eval `classpath -k -J`

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$JAVA_HOME/bin:\
$PATH:\
/usr/local/sbin:\
/usr/sbin:\
/sbin

# ---------------------------------------------------------------------------
# Aliases and functions

alias dfspace="dfspace -t ext3 -t ext2"
alias ftp=ncftp
alias gv="kghostview"
alias ghostview="kghostview"
alias invsrc='varcd invsrc'
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"

# ---------------------------------------------------------------------------
# Development stuff

export mystuff=$HOME/src/mystuff
alias mystuff="varcd mystuff"

export jsrc="$mystuff/java"
alias jsrc='varcd jsrc'

export ANT_HOME=$JAVA_ROOT/ant

PATH=\
$PATH:\
$ANT_HOME/bin

#load_file ~/bash/java.sh

# ---------------------------------------------------------------------------
# Local stuff

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
