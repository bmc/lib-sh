# ---------------------------------------------------------------------------
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=$HOME/lib/perl
export mystuff=$HOME/src/mystuff

export CLASSPATH=\
$CLASSPATH:\
/usr/share/java/hsqldb.jar:\
/usr/share/java/hsqldbutil.jar:\
/usr/share/java/mysql-connector-java.jar:\
/usr/share/java/postgresql.jar:\
$HOME/java/classes/sqlitejdbc-v056-pure.jar:\
$HOME/java/classes/h2-1.2.129.jar

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$HOME/.gem/ruby/1.8/bin:\
$HOME/local/bin:\
/usr/bin:\
/bin:\
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
alias top=htop

load_file ~/bash/java.sh
load_file ~/bash/scala.sh

# ---------------------------------------------------------------------------
# JMV consulting

export jmv=$HOME/src/consulting/jmv
alias jmv='varcd jmv'

export M2_HOME=$HOME/Applications/maven
export M2=$M2_HOME/bin
PATH=$M2:$PATH
export MAVEN_OPTS="-Xms256m -Xmx512m"

export XMLBEANS_HOME=$HOME/Applications/xmlbeans
PATH=$PATH:$XMLBEANS_HOME/bin

export CLASSPATH=\
$XMLBEANS_HOME/lib/xbean.jar:\
$XMLBEANS_HOME/lib/jsr173_1.0_api.jar:\
$CLASSPATH

PATH=$PATH:$HOME/Applications/serna/bin

# ---------------------------------------------------------------------------
# Ruby

rvm 1.8.7-p352
if interactive
then
    echo "Using Ruby $(rvm current)"
fi
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

