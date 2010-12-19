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
export SCALA_HOME=$HOME/scala/scala-2.8.0
export JYTHOM_HOME=$HOME/jython

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
$HOME/.gem/ruby/1.8/bin:\
$HOME/.cabal/bin:\
$HOME/python/bin:\
$HOME/jython/bin:\
/usr/bin:\
/bin:\
$HOME/scala/scala-2.8.0/bin:\
$PATH:\
/usr/local/sbin:\
/usr/sbin:\
/sbin

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

function switch-scala
{
    case $# in
        0)
            echo $SCALA_HOME
            return
            ;;
        1)
            ;;
        *)
            echo "Usage: switch-scala scala" >&2
            return 1
            ;;
    esac

    case "$1" in
        2.7|2.7.?)
           _n=$HOME/scala/scala-2.7.7
           ;;
        2.8|2.8.?|2.8.*|default)
           _n=$HOME/scala/scala-2.8.1
           ;;
        *)
           ;;
    esac

    if [ ! -d $_n ]
    then
        echo "No such Scala version -- $1 ($_n)" >&2
        return 1
    fi

    export PATH=$(echo $PATH | sed "s+$SCALA_HOME/bin:++g")
    if [ -n "$SCALA_HOME" ]
    then
	rmpath PATH $SCALA_HOME/bin
    fi
    export SCALA_HOME=$_n
    PATH=$SCALA_HOME/bin:$PATH
    if interactive
    then
        echo $SCALA_HOME
    fi
}

alias set-scala=switch-scala
switch-scala default

# ---------------------------------------------------------------------------
# Local stuff

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib:$HOME/lib

load_file ~/bash/ubuntu.sh

