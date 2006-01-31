# ---------------------------------------------------------------------------
# Settings and overrides specific to host "raft"
#
# $Id: devel.sh,v 1.2 2003/07/09 20:13:33 bmc Exp $
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Misc. environment variables

export PERL5LIB=/usr/local/lib/perl
export www=/usr/local/www/apache
export APACHE_HOME=$www
export TOMCAT_HOME=/usr/local/www/tomcat

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

# ---------------------------------------------------------------------------
# PATH

export PATH=\
$PATH:\
$JAVA_HOME/bin:\
/usr/local/site/sbin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin:\
$ORACLE_HOME/bin:\
$ANT_HOME/bin:\
$HOME/OpenOffice.org:\
/usr/local/firefox:\
/opt/cxoffice/bin:\
/usr/local/thunderbird

# ---------------------------------------------------------------------------
# MQ Series-specific

PATH=$PATH:/opt/mqm/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/mqm/java/lib

# ---------------------------------------------------------------------------
# Aliases and functions

alias camf="check-alt-mail-folders"
alias ftp=ncftp
alias phoenix="/usr/local/phoenix/phoenix"

# fastjar's -u option is broken. Don't use it
#_jar=`type -P fastjar`
_jar=
if [ -z "$_jar" ]
then
    _jar=$JAVA_HOME/bin/jar
fi
alias jar=$_jar
unset _jar

alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
#alias play="/usr/lib/oss/play"
alias www='varcd www'
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"

# ---------------------------------------------------------------------------
# Development stuff

load_file ~/bash/development.sh

export TIBEMS_ROOT=/opt/tibco/ems
