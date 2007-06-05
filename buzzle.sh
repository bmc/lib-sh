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
$HOME/cxoffice/bin:\
/usr/local/thunderbird:\
$JAVA_ROOT/jython:\
$JAVA_ROOT/findclasses/bin

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

alias mllog="sudo tail -f /var/log/maillog"
alias mslog="sudo tail -f /var/log/messages"
alias nslookup="$(type -P nslookup) -silent"
#alias play="/usr/lib/oss/play"
alias www='varcd www'
alias xinit="$XWINHOME/bin/xinit -- -bpp 16"

# ---------------------------------------------------------------------------
# Development stuff

load_file ~/bash/ft-development.sh

export TIBEMS_ROOT=/opt/tibco/ems
