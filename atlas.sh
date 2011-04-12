# ---------------------------------------------------------------------------
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=$HOME/lib/perl
export mystuff=$HOME/src/mystuff

export PYTHONPATH="$PYTHONPATH:/var/lib/python-support/python2.6:$HOME/lib/python:$HOME/google_appengine:/usr/share/pyshared"

export FORTUNE_FILE=$HOME/src/mystuff/fortunes/fortunes
export DFSPACE_OPTS='-t vfat'
export SCALA_HOME=$HOME/scala/scala

export CLASSPATH=\
$CLASSPATH:\
/usr/share/java/hsqldb.jar:\
/usr/share/java/hsqldbutil.jar:\
/usr/share/java/mysql-connector-java.jar:\
/usr/share/java/postgresql.jar:\
$HOME/java/classes/sqlitejdbc-v056-pure.jar:\
$HOME/java/classes/h2-1.2.129.jar

export www=/var/www
export photos=$HOME/Pictures/photos

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$HOME/.cabal/bin:\
$HOME/python/bin:\
$HOME/jython/bin:\
/usr/bin:\
/bin:\
$SCALA_HOME/bin:\
$PATH:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:

# ---------------------------------------------------------------------------
# Programmatic Completion

#unset -f _get_vpn_completions
#_get_vpn_completions()
#{
#    local cur prev possibles
#    # "cur" is the current word (the one being completed)
#    cur="${COMP_WORDS[COMP_CWORD]}"
#    # prev is the previous word type. We don't use that here.
#    prev="${COMP_WORDS[COMP_CWORD-1]}"
#
#    # COMPREPLY is a bash array in which the responses are returned
#    COMPREPLY=()
#
#    # Generate the list of possible matches (i.e., the directories under
#    # $HOME/openvpn
#    possibles=
#    for f in $HOME/openvpn/*
#    do
#        if [ -d $f ]
#        then
#            possibles="$possibles $(basename $f)"
#        fi
#    done
#
#    # Now, use the compgen built-in to generate the matches
#    COMPREPLY=( $(compgen -W "$possibles" -- $cur) )
#}
## enable completions on command "vpn"
#complete -F _get_vpn_completions vpn

# ---------------------------------------------------------------------------
# Aliases and functions

alias ftp=ncftp
alias mllog="sudo tail -f /var/log/mail.log"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
alias mystuff="varcd mystuff"
alias mypy='varcd mypy'
alias photos='varcd photos'
alias top=htop
alias www='varcd www'

load_file ~/bash/java.sh
load_file ~/bash/scala.sh

# ---------------------------------------------------------------------------
# Ruby stuff

PATH=$PATH:\
$HOME/.gem/ruby/1.8/bin:\
/var/lib/gems/1.8/bin:\

rvm 1.8.7

alias man='gem man -s'

# ---------------------------------------------------------------------------
# Python stuff

pythonbrew use 2.7.1 >/dev/null 2>&1

# ---------------------------------------------------------------------------
# Local stuff

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:$HOME/lib

load_file ~/bash/ubuntu.sh

# Not necessary on Ubuntu; Ubuntu starts one that's integrated into Gnome.
#load_file ~/bash/ssh.sh

