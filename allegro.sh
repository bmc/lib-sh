# ---------------------------------------------------------------------------
#
# $Id$
# ---------------------------------------------------------------------------

load_file ~/bash/java.sh

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=$HOME/lib/perl
export mystuff=$HOME/src/mystuff
export mypy=$mystuff/python

export PYTHONPATH="$PYTHONPATH:/var/lib/python-support/python2.6:$HOME/lib/python:$HOME/google_appengine:/usr/share/pyshared"

export FORTUNE_FILE=$HOME/lib/games/fortunes

export JYTHON_HOME=$JAVA_ROOT/jython
export JRUBY_HOME=$JAVA_ROOT/jruby
export SCALA_HOME=$HOME/scala/scala
export GRADLE_HOME=$JAVA_ROOT/gradle
export IZPACK_HOME=$JAVA_ROOT/IzPack
export ASM_HOME=$JAVA_ROOT/asm-3.2

# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------

PATH=\
$PATH:\
$HOME/python/bin:\
$JYTHON_HOME/bin:\
$ANT_HOME/bin:\
$EC2_HOME/bin:\
$HOME/google_appengine:\
$JRUBY_HOME/bin:\
$SCALA_HOME/bin:\
$GRADLE_HOME/bin

eval `classpath -k -J -x "*gcj*"`

add_dir_contents_to_classpath /usr/share/java "*gcj*"

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
# Java

export JAVA6_HOME=/usr/lib/jvm/java-6-sun
export JAVA5_HOME=/usr/lib/jvm/java-1.5.0-sun
export JAVA_HOME=$JAVA6_HOME

function switch-jdk
{
    case $# in
        0)
            echo $JAVA_HOME
            ;;
        1)
            ;;
        *)
            echo "Usage: switch-jdk jdk" >&2
            return 1
            ;;
    esac

    case "$1" in
        6|1.6|jdk6|jdk1.6*)
           _n=$JAVA6_HOME
           ;;
        5|1.5|jdk5|jdk1.5*)
           _n=$JAVA5_HOME
           ;;
        *)
           ;;
    esac

    if [ ! -d $_n ]
    then
        echo "No such JDK -- $1" >&2
        return 1
    fi

    if [ -n "$JAVA_HOME" ]
    then
	rmpath PATH $JAVA_HOME/bin
    fi
    export JAVA_HOME=$_n
    PATH=$JAVA_HOME/bin:$PATH
}

alias set-jdk=switch-jdk
