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
export usr_local_site=/mnt/condor/site
export ERLANG_HOME=/usr/lib/erlang
export mystuff=$HOME/src/mystuff

export invsrc=$HOME/src/invitemedia
export devsrc=$invsrc/dev
export libsrc=$devsrc/invitemedia/library
export proxysrc=$devsrc/invitemedia/proxy
export playground=$invsrc/playground

export PYTHONPATH=$invsrc/dev:$HOME/lib/python

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

export ANT_HOME=$JAVA_ROOT/ant

PATH=\
$HOME/python/bin:\
$PATH:\
$ANT_HOME/bin

load_file ~/bash/java.sh

eval `classpath -k -J`

rabbitmq_dir=$HOME/src/open-source/rabbitmq-1.2.0
export CLASSPATH=$invsrc/playground/rabbit/java:\
/usr/share/java/junit.jar:\
/usr/share/java/junit-3.8.2.jar:\
$rabbitmq_dir/java/test/src:\
/usr/share/java/commons-io.jar:\
$rabbitmq_dir/java/lib/junit.jar:\
$rabbitmq_dir/java/build/lib/rabbitmq-client.jar:\
$rabbitmq_dir/java/build/lib/rabbitmq-client-tests.jar:\
$CLASSPATH

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$JAVA_HOME/bin:\
$PATH:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
$ERLANG_HOME/bin:\
$ANT_HOME/bin

# ---------------------------------------------------------------------------
# Aliases and functions

alias dfspace="dfspace -t ext3 -t ext2"
alias ftp=ncftp
alias gv="kghostview"
alias ghostview="kghostview"
alias invsrc='varcd invsrc'
alias devsrc='varcd devsrc'
alias libsrc='varcd libsrc'
alias proxysrc='varcd proxysrc'
alias playground='varcd playground'
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias mystuff="varcd mystuff"

# ---------------------------------------------------------------------------
# Local stuff

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
