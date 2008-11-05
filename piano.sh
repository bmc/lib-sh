# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id$
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
export mypy=$mystuff/python

export invsrc=$HOME/src/invitemedia
export devsrc=$invsrc/dev
export libsrc=$devsrc/invitemedia/library
export proxysrc=$devsrc/invitemedia/proxy
export playground=$invsrc/playground

export PYTHONPATH=$invsrc/dev:$HOME/lib/python:$HOME/google_appengine

export FORTUNE_FILE=$HOME/lib/games/fortunes
export CREATIVE_WRAPPER_ROOT=$invsrc/creative_wrapper

export EC2_HOME=$HOME/ec2

export JYTHON_HOME=/home/bmc/java/jython/dist
export JRUBY_HOME=/home/bmc/java/jruby

# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------

PATH=\
$HOME/python/bin:\
$PATH:\
$ANT_HOME/bin:\
$EC2_HOME/bin:\
$HOME/google_appengine:\
$JYTHON_HOME/bin:\
$JRUBY_HOME/bin

load_file ~/bash/java.sh

eval `classpath -k -J`

rabbitmq_dir=$HOME/src/open-source/rabbitmq-1.2.0

add_dir_contents_to_classpath /usr/share/java

export _DJANGO_DEBUG=1
export _DJANGO_DB_USER=dashboard
export _DJANGO_DB_PASSWORD=dm28
export _DJANGO_DB_HOST=localhost
export _DJANGO_DB_NAME=dashboard
export _DJANGO_DB_ENGINE=postgresql_psycopg2


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
alias mllog="sudo tail -f /var/log/mail.log"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias mystuff="varcd mystuff"
alias mypy='varcd mypy'
alias top=htop

# ---------------------------------------------------------------------------
# Local stuff

export wwwtest="${usr_local_site}/www/apache/wwwtest"
alias wwwtest='varcd wwwtest'

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

load_file ~/bash/ubuntu.sh

# ---------------------------------------------------------------------------
# Oracle

export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
export PATH=$PATH:$ORACLE_HOME/bin
# ---------------------------------------------------------------------------
# InviteMedia-specific stuff

export CLASSPATH=$devsrc/java/InviteJava-dist.jar:$CLASSPATH
export MAXMIND_HOME=/home/bmc/src/invitemedia/MaxMind
