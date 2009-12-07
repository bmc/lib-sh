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

export invpy=$HOME/src/invitemedia
export devsrc=$invpy/dev
export invsrc=$devsrc/invitemedia
export libsrc=$devsrc/invitemedia/library
export proxysrc=$devsrc/invitemedia/proxy
export dashsrc=$devsrc/invitemedia/dashboard
export playground=$invpy/playground

export PYTHONPATH=$invpy/dev:$HOME/lib/python:$HOME/google_appengine

export FORTUNE_FILE=$HOME/lib/games/fortunes
export CREATIVE_WRAPPER_ROOT=$invpy/creative_wrapper

export EC2_HOME=$HOME/ec2

export JYTHON_HOME=/home/bmc/java/jython/dist
export JRUBY_HOME=/home/bmc/java/jruby
export SCALA_HOME=/usr/local/scala/scala

# ---------------------------------------------------------------------------

PATH=\
$HOME/python/bin:\
$HOME/src/open-source/java/jython/jython/dist/bin:\
$PATH:\
$ANT_HOME/bin:\
$EC2_HOME/bin:\
$HOME/google_appengine:\
$JYTHON_HOME/bin:\
$JRUBY_HOME/bin:\
$SCALA_HOME/bin

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
export DJANGO_SETTINGS_MODULE=invitemedia.dashboard.settings
export DJANGO_SESSION_COOKIE_AGE=86400

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
# Programmatic Completion

unset -f _get_vpn_completions
_get_vpn_completions()
{
    local cur prev possibles
    # "cur" is the current word (the one being completed)
    cur="${COMP_WORDS[COMP_CWORD]}"
    # prev is the previous word type. We don't use that here.
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # COMPREPLY is a bash array in which the responses are returned
    COMPREPLY=()

    # Generate the list of possible matches (i.e., the directories under
    # $HOME/openvpn
    possibles=
    for f in $HOME/openvpn/*
    do
        if [ -d $f ]
        then
            possibles="$possibles $(basename $f)"
        fi
    done

    # Now, use the compgen built-in to generate the matches
    COMPREPLY=( $(compgen -W "$possibles" -- $cur) )
}
# enable completions on command "vpn"
complete -F _get_vpn_completions vpn

# ---------------------------------------------------------------------------
# Aliases and functions

alias ftp=ncftp
alias invsrc='varcd invsrc'
alias invpy='varcd invpy'
alias dashsrc='varcd dashsrc'
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
