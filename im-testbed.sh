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

export invsrc=$HOME/src/invitemedia
export devsrc=$invsrc/dev
export libsrc=$devsrc/invitemedia/library
export proxysrc=$devsrc/invitemedia/proxy
export playground=$invsrc/playground


export DJANGO_CONFIG_FILE=/usr/local/invitemedia/configServer/config/run_time_local.cfg
export JAVA_HOME=/usr/lib/jvm/java-6-sun


# ---------------------------------------------------------------------------

PATH=\
/usr/local/invitemedia/bin:\
$HOME/python/bin:\
$PATH:\
$ANT_HOME/bin

load_file ~/bash/java.sh
export CLASSPATH=/usr/local/invitemedia/java/lib/InviteJava-dist.jar

rabbitmq_dir=$HOME/src/open-source/rabbitmq-1.2.0

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
alias invsrc='varcd invsrc'
alias devsrc='varcd devsrc'
alias libsrc='varcd libsrc'
alias proxysrc='varcd proxysrc'
alias playground='varcd playground'
alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias mystuff="varcd mystuff"
alias top=htop

# ---------------------------------------------------------------------------
# Local stuff

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

export TERM=xterm
