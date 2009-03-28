# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id$
# ---------------------------------------------------------------------------

load_file ~/bash/ubuntu.sh

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=$HOME/lib/perl
export www=/usr/local/www
export blog="/mnt/condor/site/chroot/apache/usr/local/apache2/htdocs/bmc/blog"
export APACHE_HOME=$www
export usr_local_site=/mnt/condor/site
export ERLANG_HOME=/usr/lib/erlang
export mystuff=$HOME/src/mystuff

export PYTHONPATH=$HOME/lib/python

# ---------------------------------------------------------------------------

PATH=\
$HOME/python/bin:\
$PATH:\
$ANT_HOME/bin

load_file ~/bash/java.sh

eval `classpath -k -J`

rabbitmq_dir=$HOME/src/open-source/rabbitmq-1.2.0
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

alias ftp=ncftp
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias mystuff="varcd mystuff"

# ---------------------------------------------------------------------------
# Local stuff

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
