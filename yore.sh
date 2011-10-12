# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id$
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=/usr/local/lib/perl
export www=/usr/local/www/apache
export APACHE_HOME=$www
export TOMCAT_HOME=/usr/local/www/tomcat
export HTML_TIDY=$HOME/.tidyrc
export AUDIOSERVER=tcp/condor:8011
export mystuff=$HOME/src/mystuff

export TERM=xterm-color
unset XTERM

# ---------------------------------------------------------------------------
# Java-related environment variables

export JAVA_ROOT=/usr/local/java
export ANT_HOME=/usr/local/java/ant

export JAVA_HOME
if [ -n "$JAVA_HOME" ]
then
    rmpath PATH "$JAVA_ROOT/jdk*/bin"
else
    export JAVA_HOME=/usr/local/java/jdk
fi

eval `classpath -k -J`

function switch-jdk
{
    case $# in
        0)
           (cd $JAVA_HOME; pwd)
	   return 0
	   ;;
        1)
            ;;
        *)
            echo "Usage: switch-jdk jdk" >&2
            return 1
            ;;
    esac

    case "$1" in
        7|1.7|jdk7|jdk1.7*)
           _n=$JAVA_ROOT/jdk1.7.0
           ;;
        6|1.6|jdk6|jdk1.6*)
           _n=$JAVA_ROOT/jdk1.6.0
           ;;
        5|1.5|jdk5|jdk1.5*)
           _n=$JAVA_ROOT/jdk1.5.0
           ;;
        4|1.4|1.4.2|jdk4|jdk1.4*)
           _n=$JAVA_ROOT/jdk1.4.2
           ;;
	ibm-5|ibm5|ibm1.5)
           _n=$JAVA_ROOT/ibm-java2-i386-50
           ;;
	ibm-6|ibm6|ibm1.6)
           _n=$JAVA_ROOT/ibm-java2-i386-60
           ;;
        *)
           if [ -d $1 ]
           then
               _n=$1
           else
               echo "No such JDK -- $1" >&2
               return 1
           fi
           ;;
    esac

    export PATH=$(echo $PATH | sed "s+$JAVA_HOME/bin:++g")
    export JAVA_HOME=$_n
    PATH=$JAVA_HOME/bin:$PATH
    echo $_n
}

alias set-jdk=switch-jdk
# ---------------------------------------------------------------------------
# PATH

export PATH=\
$HOME/python/bin:\
$PATH:\
$JAVA_HOME/bin:\
/usr/sbin:\
/sbin:\
$ORACLE_HOME/bin:\
$ANT_HOME/bin:\
$JAVA_ROOT/scala/bin

# ---------------------------------------------------------------------------
# Aliases and functions

alias camf="check-alt-mail-folders"
alias ftp=ncftp
alias mystuff="varcd mystuff"

# fastjar's -u option is broken. Don't use it
#_jar=`type -P fastjar`
_jar=
if [ -z "$_jar" ]
then
    _jar=$JAVA_HOME/bin/jar
fi
alias jar=$_jar
unset _jar

alias mllog="sudo tail -f /var/log/mail.log"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
#alias play="/usr/lib/oss/play"
alias top=htop
alias www='varcd www'
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"

# ---------------------------------------------------------------------------
# Development stuff

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export SCALA_HOME=/usr/local/scala/default
PATH=$PATH:$SCALA_HOME/bin

[[ -s "/home/bmc/.rvm/scripts/rvm" ]] && source "/home/bmc/.rvm/scripts/rvm"
rvm 1.8.7@main
